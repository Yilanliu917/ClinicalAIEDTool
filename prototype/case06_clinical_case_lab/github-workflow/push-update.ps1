param(
    [string]$Message
)

$ErrorActionPreference = 'Stop'
$RepositoryUrl = 'https://github.com/Yilanliu917/ClinicalAIEDTool.git'
$Branch = 'hiro/import-project'

function Invoke-Git {
    param(
        [Parameter(Mandatory = $true)]
        [string[]]$Arguments
    )

    & git @Arguments
    if ($LASTEXITCODE -ne 0) {
        throw "git $($Arguments -join ' ') failed with exit code $LASTEXITCODE"
    }
}

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    throw 'Git for Windows is required. Install Git, reopen PowerShell, and run this script again.'
}

$RepositoryRoot = (& git rev-parse --show-toplevel 2>$null)
if ($LASTEXITCODE -ne 0 -or -not $RepositoryRoot) {
    throw 'Run this script from inside the cloned ClinicalAIEDTool repository.'
}
Set-Location -LiteralPath $RepositoryRoot

$CurrentRemote = (& git remote get-url origin 2>$null)
if ($LASTEXITCODE -ne 0) {
    Invoke-Git -Arguments @('remote', 'add', 'origin', $RepositoryUrl)
} elseif ($CurrentRemote.TrimEnd('/') -ne $RepositoryUrl.TrimEnd('/')) {
    throw "origin is set to '$CurrentRemote'. Set it to '$RepositoryUrl' before continuing."
}

$BlockedFiles = Get-ChildItem -LiteralPath $RepositoryRoot -File -Recurse -Force -ErrorAction SilentlyContinue |
    Where-Object {
        $_.FullName -notmatch '[\\/]\.git[\\/]' -and
        (
            $_.Name -match '^\.(env)(\.|$)' -or
            $_.FullName -match '[\\/](node_modules|dist|build|__pycache__|\.pytest_cache)[\\/]'
        )
    }

if ($BlockedFiles) {
    $BlockedFiles | ForEach-Object { Write-Output ("Review and exclude: " + $_.FullName.Substring($RepositoryRoot.Length + 1)) }
    throw 'The project contains files excluded by the upload instructions. Remove them before staging.'
}

$LocalBranch = @(& git branch --list $Branch)
if ($LASTEXITCODE -ne 0) {
    throw 'Could not inspect local branches.'
}

if ($LocalBranch.Count -gt 0) {
    Invoke-Git -Arguments @('switch', $Branch)
} else {
    $RemoteBranch = @(& git ls-remote --heads origin ("refs/heads/$Branch"))
    if ($LASTEXITCODE -ne 0) {
        throw 'Could not inspect the remote branch. Check your GitHub access and network connection.'
    }

    if ($RemoteBranch.Count -gt 0) {
        Invoke-Git -Arguments @('switch', '--track', '-c', $Branch, ("origin/$Branch"))
    } else {
        Invoke-Git -Arguments @('switch', '-c', $Branch)
    }
}

Write-Output 'Current repository status:'
Invoke-Git -Arguments @('status', '--short', '--branch')

Invoke-Git -Arguments @('add', '--all')
Invoke-Git -Arguments @('status', '--short')
& git diff --cached --check
if ($LASTEXITCODE -ne 0) {
    throw 'The staged diff has whitespace errors. Fix them before committing.'
}

$HasStagedChanges = $false
& git diff --cached --quiet
if ($LASTEXITCODE -eq 1) {
    $HasStagedChanges = $true
} elseif ($LASTEXITCODE -ne 0) {
    throw 'Could not inspect the staged diff.'
}

if ($HasStagedChanges) {
    Write-Output 'Staged summary:'
    Invoke-Git -Arguments @('diff', '--cached', '--stat')
    Write-Output 'Review the full staged diff below for secrets, private information, and unwanted files:'
    & git diff --cached
    if ($LASTEXITCODE -ne 0) {
        throw 'Could not display the staged diff.'
    }

    $Approval = Read-Host 'After reviewing the diff, type PUSH to commit and push this branch'
    if ($Approval -cne 'PUSH') {
        throw 'Stopped without committing or pushing.'
    }

    if (-not $Message) {
        $Message = Read-Host 'Commit message'
    }
    if (-not $Message -or -not $Message.Trim()) {
        throw 'A commit message is required.'
    }

    Invoke-Git -Arguments @('commit', '-m', $Message)
} else {
    Write-Output 'No new staged changes. The script will push any commits already on this branch.'
}

Invoke-Git -Arguments @('push', '--set-upstream', 'origin', $Branch)
Write-Output 'Open a pull request from hiro/import-project into main:'
Write-Output 'https://github.com/Yilanliu917/ClinicalAIEDTool/compare/main...hiro/import-project'
