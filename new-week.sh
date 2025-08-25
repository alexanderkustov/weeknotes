#!/usr/bin/env bash
set -euo pipefail
d="${1:-}"
python3 - "$d" <<'PY'
import sys, datetime, os
d = sys.argv[1] if len(sys.argv)>1 and sys.argv[1] else None
dt = datetime.date.fromisoformat(d) if d else datetime.date.today()
year, week, _ = dt.isocalendar()
slug = f"w{week:02d}"
path = f"content/weeknotes/{year}/{slug}.md"
os.makedirs(os.path.dirname(path), exist_ok=True)
print(path)
PY
