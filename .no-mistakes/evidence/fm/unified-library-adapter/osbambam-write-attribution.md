# OSBAMBAM catalog write attribution

catalog.sqlite hash changes on every library_core.connect() because connect(initialize=True) runs INSERT OR REPLACE INTO schema_meta + commit (upstream OSBAMBAM, os/scripts/library_core.py:130-146).
Semantic content (.dump) before / after direct library.py search / after adapter search: identical.

sqlite3 .dump line count:      425
cmp dump0 dump1: identical
cmp dump1 dump2: identical

Row counts after all live scenarios:
outcomes|0
cards|20
status:draft|20

data/library + memory file hashes: unchanged (see osbambam-state-diff.txt, only line 1 = sqlite header differs)
