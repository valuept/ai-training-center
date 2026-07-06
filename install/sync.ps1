# Auto-update sync for the AI Training Center plugin (Windows).
# Called by the sessionStart hook on every Copilot launch. Pulls the latest
# training from GitHub and mirrors it into the local plugin cache, so each new
# session runs the newest version with no manual refresh.
# Fails quiet: never blocks a session if offline or git is missing.

$ErrorActionPreference = 'SilentlyContinue'

$src   = Join-Path $HOME '.copilot\ai-training-center-src'
$cache = Join-Path $HOME '.copilot\installed-plugins\ai-training-center\ai-training-center'

if (-not (Test-Path (Join-Path $src '.git'))) { exit 0 }   # not set up yet
if (-not (Get-Command git -ErrorAction SilentlyContinue)) { exit 0 }

# Pull latest (fast-forward only; ignore local drift).
git -C $src fetch --quiet origin 2>$null
git -C $src reset --hard --quiet origin/master 2>$null

# Mirror into the cache the client actually reads (skip .git and install/).
if (Test-Path $src) {
    New-Item -ItemType Directory -Force -Path $cache | Out-Null
    robocopy $src $cache /MIR /XD ".git" "install" /NFL /NDL /NJH /NJS /NP | Out-Null
}
exit 0
