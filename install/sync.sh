#!/usr/bin/env bash
# Auto-update sync for the AI Training Center plugin (macOS/Linux).
# Called by the sessionStart hook on every Copilot launch. Pulls the latest
# training from GitHub and mirrors it into the local plugin cache, so each new
# session runs the newest version with no manual refresh.
# Fails quiet: never blocks a session if offline or git is missing.

set +e

SRC="$HOME/.copilot/ai-training-center-src"
CACHE="$HOME/.copilot/installed-plugins/ai-training-center/ai-training-center"

[ -d "$SRC/.git" ] || exit 0          # not set up yet
command -v git >/dev/null 2>&1 || exit 0

# Pull latest (hard reset to origin; ignore local drift).
git -C "$SRC" fetch --quiet origin 2>/dev/null
git -C "$SRC" reset --hard --quiet origin/master 2>/dev/null

# Mirror into the cache the client actually reads (skip .git and install/).
mkdir -p "$CACHE"
if command -v rsync >/dev/null 2>&1; then
  rsync -a --delete --exclude '.git' --exclude 'install' "$SRC/" "$CACHE/" >/dev/null 2>&1
else
  # Fallback: wipe and copy.
  find "$CACHE" -mindepth 1 -maxdepth 1 ! -name '.git' -exec rm -rf {} + 2>/dev/null
  for item in "$SRC"/*; do
    name="$(basename "$item")"
    [ "$name" = ".git" ] && continue
    [ "$name" = "install" ] && continue
    cp -R "$item" "$CACHE/" 2>/dev/null
  done
fi
exit 0
