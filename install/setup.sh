#!/usr/bin/env bash
# One-time setup: make the AI Training Center plugin auto-update (macOS/Linux).
# Run this ONCE. After that, every Copilot session pulls the newest training
# automatically via a sessionStart hook. No more manual plugin refresh.
#
# Usage:
#   curl -fsSL https://raw.githubusercontent.com/valuept/ai-training-center/master/install/setup.sh | bash
# or, from a local clone:
#   bash install/setup.sh

set -e

REPO='https://github.com/valuept/ai-training-center.git'
SRC="$HOME/.copilot/ai-training-center-src"
HOOKS="$HOME/.copilot/hooks"
HOOK="$HOOKS/ai-training-center-update.json"

echo 'Setting up AI Training Center auto-update...'

command -v git >/dev/null 2>&1 || { echo 'git is required. Install it and re-run.'; exit 1; }

# 1) Clone or refresh the source checkout.
if [ -d "$SRC/.git" ]; then
  echo '  Updating existing checkout...'
  git -C "$SRC" fetch --quiet origin
  git -C "$SRC" reset --hard --quiet origin/master
else
  echo '  Cloning repository...'
  rm -rf "$SRC"
  git clone --quiet "$REPO" "$SRC"
fi

# 2) Install the sessionStart hook (points at the sync script in the checkout).
mkdir -p "$HOOKS"
cat > "$HOOK" <<JSON
{
  "version": 1,
  "hooks": {
    "sessionStart": [
      {
        "type": "command",
        "bash": "bash \"$SRC/install/sync.sh\"",
        "powershell": "& \"$SRC/install/sync.ps1\"",
        "timeoutSec": 30
      }
    ]
  }
}
JSON
echo "  Hook written: $HOOK"

# 3) Run the first sync now so this machine is current immediately.
bash "$SRC/install/sync.sh"

echo ''
echo 'Done. Restart GitHub Copilot once to load the hook.'
echo 'From then on, every new session auto-updates. Run @ai-trainer to start.'
