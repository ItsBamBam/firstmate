#!/usr/bin/env bash
# fm-unified-library.sh - Firstmate adapter for OSBAMBAM Unified Library lookups.
#
# This is a thin read-only adapter. It does not copy, index, or store OSBAMBAM
# cards, sources, memory, or backlog state. Search, open, and trace call the
# existing OSBAMBAM library CLI. Recall calls the existing brain.js memory
# helper. Application receipts are recorded locally under this Firstmate home.
# Intake, promotion, and library-catalog writes stay with the OSBAMBAM
# Librarian/library owner; this adapter prints those commands and refuses to
# execute them.
#
# Usage:
#   fm-unified-library.sh recall "<query>" [--k 3]
#   fm-unified-library.sh search "<issue>" [--limit 3] [--verified-only]
#   fm-unified-library.sh open <CARD-ID> [--budget 4000]
#   fm-unified-library.sh trace <CARD-ID>
#   fm-unified-library.sh record-outcome <CARD-ID> {worked|failed|mixed|unknown}
#       [--evidence <text>] [--run-id <id>]
#   fm-unified-library.sh writes
#   fm-unified-library.sh --help
#
# Environment:
#   FM_OSBAMBAM_ROOT       OSBAMBAM root. Defaults to
#                          /Users/brycemajdick/Desktop/OSBAMBAM when that
#                          directory exists.
#   FM_UNIFIED_LIBRARY_PY  Override path to library.py (tests).
#   FM_BRAIN_JS            Override path to brain.js (tests).
#   FM_HOME                Firstmate home for local outcome receipts.
#   FM_DATA_OVERRIDE       Test override for data/.
#
# Search never requests more than three cards. Verified cards are preferred.
# When a search returns no verified card, the adapter reports that finding
# instead of inventing one. Draft cards remain prior art, not authority.
# The script header owns these exact flags and paths; the unified-library
# skill owns when to load this adapter and how to treat the results.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEFAULT_OSBAMBAM_ROOT="/Users/brycemajdick/Desktop/OSBAMBAM"
SEARCH_LIMIT_MAX=3
RECALL_K_MAX=3
OPEN_BUDGET_DEFAULT=4000

die() { printf 'error: %s\n' "$1" >&2; exit 2; }

usage() {
  awk '
    NR == 1 { next }
    /^#/ { sub(/^# ?/, ""); print; next }
    { exit }
  ' "${BASH_SOURCE[0]}"
  exit "${1:-2}"
}

resolve_home() {
  if [ -n "${FM_HOME:-}" ]; then
    printf '%s\n' "$FM_HOME"
    return 0
  fi
  (cd "$SCRIPT_DIR/.." && pwd)
}

resolve_osbambam_root() {
  if [ -n "${FM_OSBAMBAM_ROOT:-}" ]; then
    printf '%s\n' "$FM_OSBAMBAM_ROOT"
    return 0
  fi
  if [ -d "$DEFAULT_OSBAMBAM_ROOT" ]; then
    printf '%s\n' "$DEFAULT_OSBAMBAM_ROOT"
    return 0
  fi
  die "OSBAMBAM root not found; set FM_OSBAMBAM_ROOT"
}

resolve_library_py() {
  if [ -n "${FM_UNIFIED_LIBRARY_PY:-}" ]; then
    printf '%s\n' "$FM_UNIFIED_LIBRARY_PY"
    return 0
  fi
  printf '%s\n' "$OSBAMBAM_ROOT/os/scripts/library.py"
}

resolve_brain_js() {
  if [ -n "${FM_BRAIN_JS:-}" ]; then
    printf '%s\n' "$FM_BRAIN_JS"
    return 0
  fi
  printf '%s\n' "$OSBAMBAM_ROOT/rubric-second-brain/brain.js"
}

require_file() {
  local path=$1 label=$2
  [ -f "$path" ] || die "$label not found: $path"
}

parse_positive_int() {
  local raw=$1 label=$2
  case "$raw" in
    '' | *[!0-9]*) die "$label must be a positive integer" ;;
  esac
  [ "$raw" -ge 1 ] || die "$label must be a positive integer"
  printf '%s\n' "$raw"
}

cap_int() {
  local value=$1 max=$2
  if [ "$value" -gt "$max" ]; then
    printf '%s\n' "$max"
  else
    printf '%s\n' "$value"
  fi
}

print_writes() {
  local library_py brain_js data_dir librarian_py
  library_py=$(resolve_library_py)
  brain_js=$(resolve_brain_js)
  librarian_py="$OSBAMBAM_ROOT/os/scripts/librarian.py"
  data_dir="${FM_DATA_OVERRIDE:-$FM_HOME/data}"
  cat <<EOF
This adapter does not write OSBAMBAM.
It does not copy cards, sources, memory, or backlog state.
Route source-linked research intake through the Librarian owner:
  python3 $librarian_py research <path>
Route source registration through the library owner:
  python3 $library_py intake <path>
Promote a card only through the library owner after its source locator, applicability, and cheapest rejection test are checked:
  python3 $library_py card-status <CARD-ID> verified --evidence <text>
Publish a catalog outcome through the library owner:
  python3 $library_py record-outcome <CARD-ID> {worked|failed|mixed|unknown}
Local application receipts stay in this Firstmate home:
  $data_dir/unified-library-outcomes.jsonl
Memory recall remains read-only:
  node $brain_js recall "<query>" --k 3
EOF
}

annotate_search() {
  python3 -c '
import json
import sys

limit = int(sys.argv[1])
verified_only = sys.argv[2] == "1"
raw = sys.stdin.read()
try:
    data = json.loads(raw)
except json.JSONDecodeError as exc:
    sys.stderr.write("error: library search did not return JSON: %s\n" % exc)
    sys.stdout.write(raw)
    sys.exit(1)
if not isinstance(data, dict):
    sys.stderr.write("error: library search did not return a JSON object\n")
    sys.stdout.write(raw)
    sys.exit(1)
cards = data.get("cards") or []
if not isinstance(cards, list):
    cards = []
verified = [c for c in cards if isinstance(c, dict) and c.get("status") == "verified"]
drafts = [c for c in cards if isinstance(c, dict) and c.get("status") == "draft"]
data["verified_present"] = bool(verified)
data["verified_count"] = len(verified)
data["draft_count"] = len(drafts)
if not verified:
    data["verified_finding"] = "no verified relevant card"
data["adapter"] = {
    "cards_are_not_authority_over_domain_gates": True,
    "drafts_are_prior_art": True,
    "limit": limit,
    "verified_only": verified_only,
}
json.dump(data, sys.stdout, indent=2, ensure_ascii=False, sort_keys=True)
sys.stdout.write("\n")
' "$1" "$2"
}

cmd_recall() {
  local query="" k=3
  while [ "$#" -gt 0 ]; do
    case "$1" in
      --k)
        [ -n "${2-}" ] || die "--k needs a value"
        k=$(parse_positive_int "$2" "--k")
        k=$(cap_int "$k" "$RECALL_K_MAX")
        shift 2
        ;;
      --help|-h) usage 0 ;;
      --*) die "unknown recall option: $1" ;;
      *)
        [ -z "$query" ] || die "recall takes one query"
        query=$1
        shift
        ;;
    esac
  done
  [ -n "$query" ] || die "recall needs a query"
  require_file "$BRAIN_JS" "brain.js"
  command -v node >/dev/null 2>&1 || die "node is required for recall"
  node "$BRAIN_JS" recall "$query" --k "$k"
}

cmd_search() {
  local query="" limit="$SEARCH_LIMIT_MAX" verified_only=0
  while [ "$#" -gt 0 ]; do
    case "$1" in
      --limit)
        [ -n "${2-}" ] || die "--limit needs a value"
        limit=$(parse_positive_int "$2" "--limit")
        limit=$(cap_int "$limit" "$SEARCH_LIMIT_MAX")
        shift 2
        ;;
      --verified-only)
        verified_only=1
        shift
        ;;
      --help|-h) usage 0 ;;
      --*) die "unknown search option: $1" ;;
      *)
        [ -z "$query" ] || die "search takes one issue"
        query=$1
        shift
        ;;
    esac
  done
  [ -n "$query" ] || die "search needs an issue"
  require_file "$LIBRARY_PY" "library.py"
  command -v python3 >/dev/null 2>&1 || die "python3 is required for search"
  local -a args=(search "$query" --limit "$limit")
  if [ "$verified_only" -eq 1 ]; then
    args+=(--statuses verified)
  fi
  local out rc=0
  set +e
  out=$(python3 "$LIBRARY_PY" "${args[@]}")
  rc=$?
  set -e
  if [ "$rc" -ne 0 ]; then
    printf '%s\n' "$out"
    exit "$rc"
  fi
  printf '%s\n' "$out" | annotate_search "$limit" "$verified_only"
}

cmd_open() {
  local identifier="" budget="$OPEN_BUDGET_DEFAULT"
  while [ "$#" -gt 0 ]; do
    case "$1" in
      --budget)
        [ -n "${2-}" ] || die "--budget needs a value"
        budget=$(parse_positive_int "$2" "--budget")
        shift 2
        ;;
      --help|-h) usage 0 ;;
      --*) die "unknown open option: $1" ;;
      *)
        [ -z "$identifier" ] || die "open takes one card id"
        identifier=$1
        shift
        ;;
    esac
  done
  [ -n "$identifier" ] || die "open needs a card id"
  require_file "$LIBRARY_PY" "library.py"
  python3 "$LIBRARY_PY" open "$identifier" --budget "$budget"
}

cmd_trace() {
  local identifier=""
  while [ "$#" -gt 0 ]; do
    case "$1" in
      --help|-h) usage 0 ;;
      --*) die "unknown trace option: $1" ;;
      *)
        [ -z "$identifier" ] || die "trace takes one card id"
        identifier=$1
        shift
        ;;
    esac
  done
  [ -n "$identifier" ] || die "trace needs a card id"
  require_file "$LIBRARY_PY" "library.py"
  python3 "$LIBRARY_PY" trace "$identifier"
}

cmd_record_outcome() {
  local card_id="" outcome="" evidence="" run_id=""
  while [ "$#" -gt 0 ]; do
    case "$1" in
      --evidence)
        [ -n "${2-}" ] || die "--evidence needs a value"
        evidence=$2
        shift 2
        ;;
      --run-id)
        [ -n "${2-}" ] || die "--run-id needs a value"
        run_id=$2
        shift 2
        ;;
      --help|-h) usage 0 ;;
      --*) die "unknown record-outcome option: $1" ;;
      *)
        if [ -z "$card_id" ]; then
          card_id=$1
        elif [ -z "$outcome" ]; then
          outcome=$1
        else
          die "record-outcome takes one card id and one outcome"
        fi
        shift
        ;;
    esac
  done
  [ -n "$card_id" ] || die "record-outcome needs a card id"
  case "$outcome" in
    worked|failed|mixed|unknown) ;;
    *) die "outcome must be worked, failed, mixed, or unknown" ;;
  esac
  command -v python3 >/dev/null 2>&1 || die "python3 is required for record-outcome"
  local data_dir receipt
  data_dir="${FM_DATA_OVERRIDE:-$FM_HOME/data}"
  mkdir -p "$data_dir"
  receipt="$data_dir/unified-library-outcomes.jsonl"
  python3 -c '
import json
import sys
from datetime import datetime, timezone

card_id, outcome, evidence, run_id, path = sys.argv[1:6]
record = {
    "card_id": card_id,
    "evidence": evidence,
    "outcome": outcome,
    "recorded_at": datetime.now(timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ"),
    "run_id": run_id or None,
    "store": "firstmate-local",
}
with open(path, "a", encoding="utf-8") as handle:
    handle.write(json.dumps(record, ensure_ascii=False, sort_keys=True) + "\n")
json.dump(record, sys.stdout, indent=2, ensure_ascii=False, sort_keys=True)
sys.stdout.write("\n")
' "$card_id" "$outcome" "$evidence" "$run_id" "$receipt"
}

bind_osbambam() {
  OSBAMBAM_ROOT="$(resolve_osbambam_root)"
  LIBRARY_PY="$(resolve_library_py)"
  BRAIN_JS="$(resolve_brain_js)"
}

bind_osbambam_soft() {
  if [ -n "${FM_OSBAMBAM_ROOT:-}" ]; then
    OSBAMBAM_ROOT="$FM_OSBAMBAM_ROOT"
  elif [ -d "$DEFAULT_OSBAMBAM_ROOT" ]; then
    OSBAMBAM_ROOT="$DEFAULT_OSBAMBAM_ROOT"
  else
    OSBAMBAM_ROOT='<FM_OSBAMBAM_ROOT>'
  fi
  LIBRARY_PY="$(resolve_library_py)"
  BRAIN_JS="$(resolve_brain_js)"
}

FM_HOME="$(resolve_home)"
OSBAMBAM_ROOT=
LIBRARY_PY=
BRAIN_JS=

[ "$#" -gt 0 ] || usage 2
case "$1" in
  -h|--help) usage 0 ;;
  recall) bind_osbambam; shift; cmd_recall "$@" ;;
  search) bind_osbambam; shift; cmd_search "$@" ;;
  open) bind_osbambam; shift; cmd_open "$@" ;;
  trace) bind_osbambam; shift; cmd_trace "$@" ;;
  record-outcome) shift; cmd_record_outcome "$@" ;;
  writes) bind_osbambam_soft; print_writes ;;
  intake|ingest|card-status|apply-card-draft|import-stage-card|seed-grok|init|rebuild|snapshot|index|quarantine|restore|purge-ready|duplicates)
    bind_osbambam_soft
    printf 'error: %s is an OSBAMBAM library write; this adapter refuses it\n' "$1" >&2
    print_writes >&2
    exit 2
    ;;
  *) die "unknown command: $1" ;;
esac
