# One-time setup: make the AI Training Center plugin auto-update (Windows).
# Run this ONCE. After that, every Copilot session pulls the newest training
# automatically via a sessionStart hook. No more manual plugin refresh.
#
# Usage (PowerShell):
#   irm https://raw.githubusercontent.com/valuept/ai-training-center/master/install/setup.ps1 | iex
# or, from a local clone:
#   .\install\setup.ps1

$ErrorActionPreference = 'Stop'

$repo  = 'https://github.com/valuept/ai-training-center.git'
$src   = Join-Path $HOME '.copilot\ai-training-center-src'
$hooks = Join-Path $HOME '.copilot\hooks'
$hook  = Join-Path $hooks 'ai-training-center-update.json'

Write-Host 'Setting up AI Training Center auto-update...' -ForegroundColor Cyan

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    throw 'git is required. Install it (winget install Git.Git) and re-run.'
}

# 1) Clone or refresh the source checkout.
if (Test-Path (Join-Path $src '.git')) {
    Write-Host '  Updating existing checkout...'
    git -C $src fetch --quiet origin
    git -C $src reset --hard --quiet origin/master
} else {
    Write-Host '  Cloning repository...'
    if (Test-Path $src) { Remove-Item $src -Recurse -Force }
    git clone --quiet $repo $src
}

# 2) Install the sessionStart hook (points at the sync script in the checkout).
New-Item -ItemType Directory -Force -Path $hooks | Out-Null
$syncPs = (Join-Path $src 'install\sync.ps1')
$syncSh = "$HOME/.copilot/ai-training-center-src/install/sync.sh"
$hookObj = [ordered]@{
    version = 1
    hooks   = [ordered]@{
        sessionStart = @(
            [ordered]@{
                type       = 'command'
                bash       = "bash `"$syncSh`""
                powershell = "& `"$syncPs`""
                timeoutSec = 30
            }
        )
    }
}
$hookObj | ConvertTo-Json -Depth 6 | Set-Content -Path $hook -Encoding Ascii
Write-Host "  Hook written: $hook"

# 3) Run the first sync now so this machine is current immediately.
& (Join-Path $src 'install\sync.ps1')

Write-Host ''
Write-Host 'Done. Restart GitHub Copilot once to load the hook.' -ForegroundColor Green
Write-Host 'From then on, every new session auto-updates. Run @ai-trainer to start.'
