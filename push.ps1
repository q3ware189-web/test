$ErrorActionPreference = "Stop"
$git = "C:\Program Files\Git\cmd\git.exe"

& $git init
& $git config user.email "amber@example.com"
& $git config user.name "amber_lee"
& $git add back_end_6.html

# Ignore commit errors if there's nothing new to commit
try {
    & $git commit -m "Update keyword search max length to 6"
} catch {
    Write-Host "Nothing to commit or commit failed."
}

$remotes = & $git remote
if ($remotes -match "origin") {
    & $git remote set-url origin https://github.com/q3ware189-web/test.git
} else {
    & $git remote add origin https://github.com/q3ware189-web/test.git
}

& $git branch -M main
& $git push -u origin main
