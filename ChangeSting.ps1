param ($Path, $oldString, $newString)

Get-ChildItem -Path $Path -Recurse -Force | Where-Object {$_.PSIsContainer -eq $false} | ForEach-Object {
    $file = $_.FullName
    (Get-Content $file) | Foreach-Object {$_ -replace $oldString, $newString} | Set-Content $file
}

Write-Host "Replace operation completed."