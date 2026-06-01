#!/usr/bin/env bash
# sync-hook.sh — called by Claude Code PostToolUse hook
# Reads hook JSON from stdin. If the written/edited file is inside
# this repo, stages everything, commits with filename+timestamp, pushes.

INPUT=$(cat)
FILE=$(echo "$INPUT" | python -c "import sys,json; d=json.load(sys.stdin); print(d.get('tool_input',{}).get('file_path',''))" 2>/dev/null || true)

# Only act on files that live inside the my-edge folder
echo "$FILE" | grep -qi "my-edge" || exit 0

REPO="/c/Users/noaha/OneDrive/Desktop/CLAUDE COWORK/OUTPUTS/Jobs/my-edge"
cd "$REPO" 2>/dev/null || exit 0

git add -A

# Nothing staged? Nothing to do.
git diff --cached --quiet && exit 0

FNAME=$(basename "$FILE")
STAMP=$(date '+%Y-%m-%d %H:%M')
git commit -m "auto-sync: $FNAME [$STAMP]"
git push || true   # never block Claude even if push fails

exit 0
