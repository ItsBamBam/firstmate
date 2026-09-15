# fm-unified-library.sh live transcript against real OSBAMBAM

Root: default /Users/brycemajdick/Desktop/OSBAMBAM (FM_OSBAMBAM_ROOT unset)

### $ bin/fm-unified-library.sh --help
```
fm-unified-library.sh - Firstmate adapter for OSBAMBAM Unified Library lookups.

This is a thin read-only adapter. It does not copy, index, or store OSBAMBAM
cards, sources, memory, or backlog state. Search, open, and trace call the
existing OSBAMBAM library CLI. Recall calls the existing brain.js memory
helper. Intake, promotion, and outcome writes stay with the OSBAMBAM
Librarian/library owner; this adapter prints those commands and refuses to
execute them.

Usage:
  fm-unified-library.sh recall "<query>"
  fm-unified-library.sh search "<issue>"
  fm-unified-library.sh open <CARD-ID>
  fm-unified-library.sh trace <CARD-ID>
  fm-unified-library.sh record-outcome <CARD-ID> {worked|failed|mixed|unknown}
      [--evidence <text>] [--run-id <id>]
  fm-unified-library.sh writes
  fm-unified-library.sh --help

Environment:
  FM_OSBAMBAM_ROOT  OSBAMBAM root. Defaults to
                    /Users/brycemajdick/Desktop/OSBAMBAM when that
                    directory exists. library.py and brain.js are
                    derived from it.

Search always requests three cards and open always uses a 4000 budget, the
contract's fixed lookup surface. The library CLI already orders
verified cards first. When a search returns no verified card, the adapter
reports that finding instead of inventing one. Draft cards remain prior art,
not authority. record-outcome prints the library-owner command for the
outcome rather than writing a local receipt.
The script header owns these exact flags and paths; the unified-library
skill owns when to load this adapter and how to treat the results.
```
exit=0

### $ bin/fm-unified-library.sh search stage prove method
```
{
  "adapter": {
    "cards_are_not_authority_over_domain_gates": true,
    "drafts_are_prior_art": true
  },
  "cards": [
    {
      "applies_when": "Working specifically in the PROVE stage.",
      "body_path": "/Users/brycemajdick/Desktop/OSBAMBAM/artifacts/data/library/cards/technology/method-stages/CARD-STAGE-PROVE.md",
      "card_id": "CARD-STAGE-PROVE",
      "citation_status": "citation_pending",
      "domain": "technology",
      "fail_look": "demo that cannot kill. “We’ll see when we build it” on a one-way door.",
      "one_line": "cheapest fact that would change the design.",
      "scope": "general",
      "solution": "write kill-condition first. Then spike / skeleton / measure / model — whichever is cheapest for the riskiest assumption.",
      "source_item_id": "SRC-C19B42F7121949ED",
      "source_revision_id": "SRC-C19B42F7121949ED-R0001-74E8F7CFA2DC",
      "status": "draft",
      "title": "PROVE",
      "tradeoffs": "This is a candidate method card, not OSBAMBAM authority.",
      "verification": "assumption is now evidence, or design died."
    },
    {
      "applies_when": "Working specifically in the LEARN stage.",
      "body_path": "/Users/brycemajdick/Desktop/OSBAMBAM/artifacts/data/library/cards/technology/method-stages/CARD-STAGE-LEARN.md",
      "card_id": "CARD-STAGE-LEARN",
      "citation_status": "citation_pending",
      "domain": "technology",
      "fail_look": "“we should test more.”",
      "one_line": "update the prior.",
      "scope": "general",
      "solution": "five lines same day — wrong load; which shape now; which stage was fake; what next LOAD must include; ADR to supersede if needed.",
      "source_item_id": "SRC-21EDF6D153FD4831",
      "source_revision_id": "SRC-21EDF6D153FD4831-R0001-F6B7A84B4D14",
      "status": "draft",
      "title": "LEARN",
      "tradeoffs": "This is a candidate method card, not OSBAMBAM authority.",
      "verification": "lesson lives where next LOAD will find it."
    },
    {
      "applies_when": "Working specifically in the QUALIFY stage.",
      "body_path": "/Users/brycemajdick/Desktop/OSBAMBAM/artifacts/data/library/cards/technology/method-stages/CARD-STAGE-QUALIFY.md",
      "card_id": "CARD-STAGE-QUALIFY",
      "citation_status": "citation_pending",
      "domain": "technology",
      "fail_look": "“looks good in the chat.”",
      "one_line": "decide if the slice may integrate.",
      "scope": "general",
      "solution": "promised vs observed vs evidence vs PASS/FAIL/WAIVED + owner. Fail names the stage to re-enter.",
      "source_item_id": "SRC-237C51307FB749B8",
      "source_revision_id": "SRC-237C51307FB749B8-R0001-0F52F65B8CB8",
      "status": "draft",
      "title": "QUALIFY",
      "tradeoffs": "This is a candidate method card, not OSBAMBAM authority.",
      "verification": "verdict written."
    }
  ],
  "limit": 3,
  "query": "stage prove method",
  "sources": [
    {
      "availability": "local",
      "current_revision_id": "SRC-C19B42F7121949ED-R0001-74E8F7CFA2DC",
      "domain": "technology",
      "extraction_status": "ok",
      "item_id": "SRC-C19B42F7121949ED",
      "lexical_score": -3.214003633264243,
      "normalized_path": "/Users/brycemajdick/Desktop/OSBAMBAM/artifacts/data/library/sources/SRC-C19B42F7121949ED/revisions/SRC-C19B42F7121949ED-R0001-74E8F7CFA2DC/normalized.md",
      "scope": "general",
      "title": "CARD-PROVE"
    },
    {
      "availability": "local",
      "current_revision_id": "SRC-751063122BC64009-R0001-7765469019D3",
      "domain": "technology",
      "extraction_status": "ok",
      "item_id": "SRC-751063122BC64009",
      "lexical_score": -2.2347005587789717,
      "normalized_path": "/Users/brycemajdick/Desktop/OSBAMBAM/artifacts/data/library/sources/SRC-751063122BC64009/revisions/SRC-751063122BC64009-R0001-7765469019D3/normalized.md",
      "scope": "general",
      "title": "Grok Teacher Library Index"
    },
    {
      "availability": "local",
      "current_revision_id": "SRC-53FA90789CAF4108-R0001-3AEADBEF7D35",
      "domain": "technology",
      "extraction_status": "ok",
      "item_id": "SRC-53FA90789CAF4108",
      "lexical_score": -1.4022689588465465,
      "normalized_path": "/Users/brycemajdick/Desktop/OSBAMBAM/artifacts/data/library/sources/SRC-53FA90789CAF4108/revisions/SRC-53FA90789CAF4108-R0001-3AEADBEF7D35/normalized.md",
      "scope": "general",
      "title": "2026-09-09-01-gpt6-max-library-design"
    }
  ],
  "status": "ok",
  "verified_finding": "no verified relevant card"
}
```
exit=0

### $ bin/fm-unified-library.sh open CARD-STAGE-PROVE
```
{
  "content": "---\nid: \"CARD-STAGE-PROVE\"\nsource_item: \"SRC-C19B42F7121949ED\"\nsource_revision: \"SRC-C19B42F7121949ED-R0001-74E8F7CFA2DC\"\ndomain: \"technology\"\nscope: \"general\"\ncollection: \"method/stages\"\ntype: \"method\"\nstage: \"PROVE\"\nstatus: \"draft\"\ncitation_status: \"citation_pending\"\nconfidence: \"candidate\"\ntechnologies: []\nsource_locator: \"/Users/brycemajdick/Desktop/OS/KERNEL-Owner-Desk-Teacher-Grok-4.6-2026-09-13/teacher-agent/library/01_stages/CARD-PROVE.md (underlying named sources need exact locators)\"\nsource_names: \"Torres assumption test; Carmack slice; Gall’s Law; Lamport model when state is the risk\"\n---\n\n# PROVE\n\ncheapest fact that would change the design.\n\n## Point\ncheapest fact that would change the design.\n\n## Move\nwrite kill-condition first. Then spike / skeleton / measure / model — whichever is cheapest for the riskiest assumption.\n\n## Applies when\nWorking specifically in the PROVE stage.\n\n## Tradeoffs\nThis is a candidate method card, not OSBAMBAM authority.\n\n## Verify\nassumption is now evidence, or design died.\n\n## Fail-look\ndemo that cannot kill. “We’ll see when we build it” on a one-way door.\n\n## Evidence\n- Source item: `SRC-C19B42F7121949ED`\n- Source revision: `SRC-C19B42F7121949ED-R0001-74E8F7CFA2DC`\n- Locator: `/Users/brycemajdick/Desktop/OS/KERNEL-Owner-Desk-Teacher-Grok-4.6-2026-09-13/teacher-agent/library/01_stages/CARD-PROVE.md (underlying named sources need exact locators)`\n- Named upstream sources: Torres assumption test; Carmack slice; Gall’s Law; Lamport model when state is the risk\n",
  "identifier": "CARD-STAGE-PROVE",
  "kind": "card",
  "source_item_id": "SRC-C19B42F7121949ED",
  "source_revision_id": "SRC-C19B42F7121949ED-R0001-74E8F7CFA2DC",
  "status": "ok",
  "truncated": false
}
```
exit=0

### $ bin/fm-unified-library.sh trace CARD-STAGE-PROVE
```
{
  "identity": {
    "kind": "card",
    "record": {
      "applies_when": "Working specifically in the PROVE stage.",
      "body_path": "/Users/brycemajdick/Desktop/OSBAMBAM/artifacts/data/library/cards/technology/method-stages/CARD-STAGE-PROVE.md",
      "body_sha256": "ff2113706a1d52ab0d8a0401c71aa7ef930c1eb5f98a814443a9a253040aa582",
      "card_id": "CARD-STAGE-PROVE",
      "card_type": "method",
      "citation_status": "citation_pending",
      "collection": "method/stages",
      "confidence": "candidate",
      "created_at": "2026-09-14T13:03:02-07:00",
      "domain": "technology",
      "fail_look": "demo that cannot kill. “We’ll see when we build it” on a one-way door.",
      "one_line": "cheapest fact that would change the design.",
      "problem": "cheapest fact that would change the design.",
      "scope": "general",
      "solution": "write kill-condition first. Then spike / skeleton / measure / model — whichever is cheapest for the riskiest assumption.",
      "source_item_id": "SRC-C19B42F7121949ED",
      "source_revision_id": "SRC-C19B42F7121949ED-R0001-74E8F7CFA2DC",
      "stage": "PROVE",
      "status": "draft",
      "technologies": "[]",
      "title": "PROVE",
      "tradeoffs": "This is a candidate method card, not OSBAMBAM authority.",
      "updated_at": "2026-09-14T13:03:02-07:00",
      "verification": "assumption is now evidence, or design died."
    },
    "status": "found"
  },
  "outcomes": [],
  "relations": [
    {
      "evidence_locator": "/Users/brycemajdick/Desktop/OS/KERNEL-Owner-Desk-Teacher-Grok-4.6-2026-09-13/teacher-agent/library/01_stages/CARD-PROVE.md (underlying named sources need exact locators)",
      "object_id": "SRC-C19B42F7121949ED",
      "object_revision_id": "SRC-C19B42F7121949ED-R0001-74E8F7CFA2DC",
      "observed_at": "2026-09-14T13:03:02-07:00",
      "relation": "derived_from",
      "relation_id": 12,
      "subject_id": "CARD-STAGE-PROVE",
      "subject_revision_id": "ff2113706a1d52ab0d8a0401c71aa7ef930c1eb5f98a814443a9a253040aa582"
    }
  ]
}
```
exit=0

### $ bin/fm-unified-library.sh recall Bryce preferences decisions
```

=== memory/feedback_migration_decisions_1_5.md  (score 6)
---
name: migration-decisions-1-5
description: DECISIONS (Bryce, 2026-09-05 23:05, given directly to the seat): (1) OSBAMBAM is ONE git repo — engine, wri...
metadata:
  type: feedback
---

DECISIONS (Bryce, 2026-09-05 23:05, given directly to the seat): (1) OSBAMBAM is ONE git repo — engine, writer, TES core tracked by the root .git; evidence/corpora/recon/logs ignored, bones only; split later only if the ledger shows a real problem. (2) Engine history: simple — copy in, one commit naming the old SHA, BAMBAM_AI_OS archived intact. (3) SAM is the seat. (4) Evidence lives inside OSBAMBAM, ignored. (5) /soap-draft follows the engine's law after Phase 2. Do not re-propose nested repos or submodules.

*Saved 2026-09-06 via brain store.*


=== memory/feedback_interoperability_and_flexibility.md  (score 4)
---
name: interoperability-and-flexibility
description: Bryce, 2026-09-13: 'I'm all about interoperability and flexibility.' Standing preference for every install ...
metadata:
  type: feedback
---

Bryce, 2026-09-13: 'I'm all about interoperability and flexibility.' Standing preference for every install and design choice: prefer what works across runtimes (Claude Code, Codex, Cursor, Hermes, Antigravity) and across machines (this Mac, the Mini); open formats over proprietary; a global copy of a skill is welcome alongside the OS copy; never lock a workflow to one vendor, one folder, or one agent when a portable form exists. Links to 'one skills library' ruling (2026-09-11) and the Pstack two-lanes decision.

*Saved 2026-09-13 via brain store.*


2026-09-13, during the role swap (Bryce): "REMEMBER WE WANT TO BE platform AGNOSTIC. AND FLEXIBLE MODULAR." Applied the same night: seats are files any runtime can boot (kernel → Seats, NEO.md, TES.md, AGENTS.md); one source with generated per-runtime projections (skills); never a rule only one vendor can read.


=== memory/project_arch_v1_001_packet_awaiting_bryce.md  (score 4)
---
name: arch-v1-001-packet-awaiting-bryce
description: ARCH-V1-001 (2026-09-11): the Architecture v1 decision packet is at os/missions/ARCH-V1-001/DECISION_PACKET...
metadata:
  type: project
---

ARCH-V1-001 (2026-09-11): the Architecture v1 decision packet is at os/missions/ARCH-V1-001/DECISION_PACKET.md, awaiting Bryce's answers E1–E7 by number (E1 adopt thesis+dispositions; E2 Compass placement, pick on-demand; E3 builder write sandbox; E4 tree stays in Drive mirror; E5 financial provider allowlist = 2026-09-08 ruling; E6 Standard Agent Guidelines v0.1 as common floor + role experiment; E7 keep this Mac). ADR-0009 is written only from his answers. Standard Agent Guidelines v0.1 and ROLE_AUDIT.md sit beside it; nothing installed.

*Saved 2026-09-11 via brain store.*


[brain] 3 hits · 18,554 bytes read · 2.64ms
```
exit=0

### $ bin/fm-unified-library.sh record-outcome CARD-STAGE-PROVE mixed --evidence kill-condition written; spike not yet run --run-id nm-01M2HZHN
```
Outcome mixed for CARD-STAGE-PROVE is a library-owner write; this adapter does not execute it.
Record it through the library owner:
  python3 /Users/brycemajdick/Desktop/OSBAMBAM/os/scripts/library.py record-outcome CARD-STAGE-PROVE mixed --evidence kill-condition\ written\;\ spike\ not\ yet\ run --run-id nm-01M2HZHN
```
exit=0

### $ bin/fm-unified-library.sh record-outcome CARD-STAGE-PROVE partly
```
error: outcome must be worked, failed, mixed, or unknown
```
exit=2

### $ bin/fm-unified-library.sh writes
```
This adapter does not write OSBAMBAM.
It does not copy cards, sources, memory, or backlog state.
Route source-linked research intake through the Librarian owner:
  python3 /Users/brycemajdick/Desktop/OSBAMBAM/os/scripts/librarian.py research <path>
Route source registration through the library owner:
  python3 /Users/brycemajdick/Desktop/OSBAMBAM/os/scripts/library.py intake <path>
Promote a card only through the library owner after its source locator, applicability, and cheapest rejection test are checked:
  python3 /Users/brycemajdick/Desktop/OSBAMBAM/os/scripts/library.py card-status <CARD-ID> verified --evidence <text>
Record an application outcome through the library owner:
  python3 /Users/brycemajdick/Desktop/OSBAMBAM/os/scripts/library.py record-outcome <CARD-ID> {worked|failed|mixed|unknown} [--evidence <text>] [--run-id <id>]
Memory recall remains read-only:
  node /Users/brycemajdick/Desktop/OSBAMBAM/rubric-second-brain/brain.js recall "<query>"
```
exit=0

### $ bin/fm-unified-library.sh intake /tmp/some-source.md
```
error: unknown command: intake
This adapter does not write OSBAMBAM.
It does not copy cards, sources, memory, or backlog state.
Route source-linked research intake through the Librarian owner:
  python3 /Users/brycemajdick/Desktop/OSBAMBAM/os/scripts/librarian.py research <path>
Route source registration through the library owner:
  python3 /Users/brycemajdick/Desktop/OSBAMBAM/os/scripts/library.py intake <path>
Promote a card only through the library owner after its source locator, applicability, and cheapest rejection test are checked:
  python3 /Users/brycemajdick/Desktop/OSBAMBAM/os/scripts/library.py card-status <CARD-ID> verified --evidence <text>
Record an application outcome through the library owner:
  python3 /Users/brycemajdick/Desktop/OSBAMBAM/os/scripts/library.py record-outcome <CARD-ID> {worked|failed|mixed|unknown} [--evidence <text>] [--run-id <id>]
Memory recall remains read-only:
  node /Users/brycemajdick/Desktop/OSBAMBAM/rubric-second-brain/brain.js recall "<query>"
```
exit=2

### $ bin/fm-unified-library.sh card-status CARD-STAGE-PROVE verified --evidence x
```
error: unknown command: card-status
This adapter does not write OSBAMBAM.
It does not copy cards, sources, memory, or backlog state.
Route source-linked research intake through the Librarian owner:
  python3 /Users/brycemajdick/Desktop/OSBAMBAM/os/scripts/librarian.py research <path>
Route source registration through the library owner:
  python3 /Users/brycemajdick/Desktop/OSBAMBAM/os/scripts/library.py intake <path>
Promote a card only through the library owner after its source locator, applicability, and cheapest rejection test are checked:
  python3 /Users/brycemajdick/Desktop/OSBAMBAM/os/scripts/library.py card-status <CARD-ID> verified --evidence <text>
Record an application outcome through the library owner:
  python3 /Users/brycemajdick/Desktop/OSBAMBAM/os/scripts/library.py record-outcome <CARD-ID> {worked|failed|mixed|unknown} [--evidence <text>] [--run-id <id>]
Memory recall remains read-only:
  node /Users/brycemajdick/Desktop/OSBAMBAM/rubric-second-brain/brain.js recall "<query>"
```
exit=2

### $ bin/fm-unified-library.sh purge-ready
```
error: unknown command: purge-ready
This adapter does not write OSBAMBAM.
It does not copy cards, sources, memory, or backlog state.
Route source-linked research intake through the Librarian owner:
  python3 /Users/brycemajdick/Desktop/OSBAMBAM/os/scripts/librarian.py research <path>
Route source registration through the library owner:
  python3 /Users/brycemajdick/Desktop/OSBAMBAM/os/scripts/library.py intake <path>
Promote a card only through the library owner after its source locator, applicability, and cheapest rejection test are checked:
  python3 /Users/brycemajdick/Desktop/OSBAMBAM/os/scripts/library.py card-status <CARD-ID> verified --evidence <text>
Record an application outcome through the library owner:
  python3 /Users/brycemajdick/Desktop/OSBAMBAM/os/scripts/library.py record-outcome <CARD-ID> {worked|failed|mixed|unknown} [--evidence <text>] [--run-id <id>]
Memory recall remains read-only:
  node /Users/brycemajdick/Desktop/OSBAMBAM/rubric-second-brain/brain.js recall "<query>"
```
exit=2

### $ bin/fm-unified-library.sh search stage prove method --limit 10
```
error: unknown search option: --limit
```
exit=2

### $ bin/fm-unified-library.sh search stage prove method --verified-only
```
error: unknown search option: --verified-only
```
exit=2

### $ bin/fm-unified-library.sh open CARD-STAGE-PROVE --budget 99999999
```
error: unknown open option: --budget
```
exit=2

### $ bin/fm-unified-library.sh recall Bryce preferences --k 50
```
error: unknown recall option: --k
```
exit=2

### $ env FM_OSBAMBAM_ROOT=/nonexistent/osbambam bin/fm-unified-library.sh search anything
```
error: library.py not found: /nonexistent/osbambam/os/scripts/library.py
```
exit=2

### shell round-trip of the printed owner command (parsed with eval into argv, NOT executed)
```
argv[1]=python3
argv[2]=/Users/brycemajdick/Desktop/OSBAMBAM/os/scripts/library.py
argv[3]=record-outcome
argv[4]=CARD-STAGE-PROVE
argv[5]=mixed
argv[6]=--evidence
argv[7]=kill-condition written; spike not yet run
argv[8]=--run-id
argv[9]=nm-01M2HZHN
```

### $ bin/fm-unified-library.sh open SRC-751063122BC64009
```
{
  "content": "# INDEX\nSend this index to the teacher. Do not send the shelves whole.\n\n## 01_stages\n- CARD-SCALE.md — match ink to unwind cost\n- CARD-PROBLEM.md — after-state, no tools\n- CARD-LOAD.md — knowns/unknowns/prior/related; stop when VOI dies\n- CARD-HORIZON.md — how far this loop may see\n- CARD-FRAME.md — goal, non-goals, invariants, signals\n- CARD-FORGE.md — two shapes; loser loses on the frame\n- CARD-BREAK.md — kill list; attackers do not take the pen\n- CARD-PROVE.md — cheapest fact that can kill the winner\n- CARD-COMMIT.md — decision + reopen-if; model is not owner\n- CARD-PLAN.md — slices that match commit\n- CARD-BUILD.md — translate only\n- CARD-QUALIFY.md — observed effect → verdict\n- CARD-LEARN.md — which stage was false\n- CARD-EVOLVE.md — factory changes need an ADR\n\n## 03_fail_looks\n- FAIL-TOOL-IN-PROBLEM.md\n- FAIL-ONE-SHAPE.md\n- FAIL-PROOF-CANNOT-KILL.md\n- FAIL-FOLDER-BUILD.md\n\n## 06_do_not\n- DO-NOT-ULTRA-WAREHOUSE.md\n- DO-NOT-LAUNCH-CARD-AS-NOW.md\n\n## 02_examples\n- EX-IDEMPOTENT-CHARGE.md — full loop on a one-way money door (when copied from KERNEL_EXAMPLE)\n\nAdd rows as you drop files. Teacher retrieves by title from this list only.\n",
  "identifier": "SRC-751063122BC64009",
  "kind": "collection-index",
  "locator": "/Users/brycemajdick/Desktop/OSBAMBAM/artifacts/data/library/sources/SRC-751063122BC64009/revisions/SRC-751063122BC64009-R0001-7765469019D3/normalized.md#L1",
  "revision_id": "SRC-751063122BC64009-R0001-7765469019D3",
  "status": "ok",
  "truncated": false
}
```
exit=0

### $ bin/fm-unified-library.sh open SRC-50D8DAB87C1E4615
```
{
  "content": "# MIGRATION-DESKTOP-001 — closeout part 1 (pre-resume) · **READY TO RESUME**\n\nDate: 2026-09-09 14:00–14:15 PT · Author: SAM (seat) · Mission: `os/missions/MIGRATION-DESKTOP-001/MISSION.md`\nVerdict: **Drive is READY TO RESUME.** This verdict is independent of ROLE-CAPABILITY-PSTACK-001; nothing here waits on it.\nRecovery material is retained in full. Nothing was deleted. Cloud recovery is **not proven** — see §4.\n\n## 1. What the existing receipts already prove (not re-run)\n- Batches A–E copied/moved and byte-verified, **0 failed verifications**; F managed in place (MISSION.md batch table; commits 1f218e0 → 936f656).\n- Full consumption: 104,916 files / 50.71 GB recorded at commit 936f656.\n- Rollback: `~/Workspace/_migration_rollback/2026-09-09/` outside the Drive mirror.\n- Frozen tax receipts deliberately not rewritten; translation note in the TAX mission file.\n\n## 2. Missing checks run today\n| # | Check | Result | Evidence |\n|---|---|---|---|\n| 1 | Rollback intact | **17,500 files / 4.1 GB present, untouched** (batchA, batchD, batchE, BAMBAM_AI_OS, BAMBAM_AI_OS.worktrees, BAM_BAM_OS, FREEDOM_COMMAND_CENTER, _ARCHIVE_2026-09-05) | `find … -type f \\| wc -l`; `du -sh` |\n| 2 | Disk | 31 GB free of 228 GB (28% used) | `df -h /` |\n| 3 | Imports tree on disk | 104,739 regular files / 39 GB local bytes (the 104,916 figure counted entries incl. dirs/links; not a loss signal — every batch hash-verified) | `os.walk` scan, 4 s |\n| 4 | Paused writer restored | `com.osbambam.librarian` loaded, WatchPaths active, last exit 0 | `launchctl print gui/501/com.osbambam.librarian` |\n| 5 | Live services | Hermes gateway pid 25378 up; 4 Hermes crons active (nightly ran 23:30 ok); rubric/serve/console/second-brain/librarian/hard-copy LaunchAgents loaded; cloudflared tunnel up (pid 791) | `launchctl list`, `hermes cron list` |\n| 6 | LaunchAgents → moved paths | **none**. Every plist references only `Desktop/OSBAMBAM/...` and `~/Downloads/_OS` | grep over `~/Library/LaunchAgents/*.plist` |\n| 7 | Hermes config/crons → moved paths | none; workdir = OSBAMBAM; the six tax cards write only under `OSBAMBAM/artifacts/money/…` | `~/.hermes/config.yaml:130`; `hermes kanban show t_a6e3dfb2` line 29 |\n| 8 | Codex → moved paths | 4 stale **project-trust** entries (`Desktop/TES-CI-OS`, `Desktop/BAMBAM_AI_OS`, `Documents/Codex/2026-09-03/…`, `Desktop/CODEX_BASELINE_V00`) — inert; the one Codex automation's cwd is OSBAMBAM | `~/.codex/config.toml:119-140`; `automation.toml:12` |\n| 9 | Running processes → moved paths | none | `ps aux` grep |\n| 10 | Live bones → moved paths | see §3 (D1, D2) | grep, worktrees/artifacts/history excluded |\n| 11 | **Dataless (cloud-only) stubs inside imports** | **6,205 files / 9.14 GB have no local bytes** (`st_blocks == 0`) | scan table below |\n| 12 | Conflict copies (`<name> 2.<ext>`) inside imports | 914 moved as-is (desktop 382 · clinical 245 · repos 233 · _restricted 33 · screenshots 10 · archive 9 · downloads 1 · documents 1); 231 remain in `chiro/projects/tes/` (known, retro W36 decision 2) | `find -name \"* 2.*\"` |\n| 13 | Home folders | Desktop: OSBAMBAM + 28 protected `.gdoc` + `Pstack_OSBAMBAM_Audit_and_Adoption_Plan.md` (dropped loose today). Downloads: `_OS` only. Documents: 4 app-managed folders | `ls` |\n\nDataless stubs by folder (content is in Drive's cloud, not on this Mac):\n\n| files | MB | folder |\n|---:|---:|---|\n| 3,499 | 180 | `documents/Codex` |\n| 2,110 | 3,948 | `desktop/TO default (transfer ownership to default)` |\n| 159 | 97 | `desktop/Takeout` |\n| 121 | 74 | `desktop/Desktop` |\n| 112 | 49 | `clinical/01_Chiro_Projects` |\n| 89 | 37 | `documents/GitHub` |\n| 24 | 9 | `_restricted/2025 Taxes` |\n| 21 | 50 | `_restricted/documents-Takeout` |\n| 16 | 4,581 | `desktop/Drive-Personal` |\n| 54 | ~110 | eleven smaller folders |\n| **6,205** | **9,140** | **total** |\n\n## 3. Deviations recorded\n**D1 · Tax location.** `~/Desktop/2025 Taxes` → `imports/2026-09-09/_restricted/2025 Taxes` (795 files / 0.31 GB, same-volume rename, count",
  "identifier": "SRC-50D8DAB87C1E4615",
  "kind": "research",
  "locator": "/Users/brycemajdick/Desktop/OSBAMBAM/artifacts/data/library/sources/SRC-50D8DAB87C1E4615/revisions/SRC-50D8DAB87C1E4615-R0001-3AED0ADC25FD/normalized.md#L1",
  "revision_id": "SRC-50D8DAB87C1E4615-R0001-3AED0ADC25FD",
  "status": "ok",
  "truncated": true
}
```
exit=0
