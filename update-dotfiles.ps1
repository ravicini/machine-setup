# update powershell profile
$newContent = Get-Content .\configs\powershell.profile
$newContent | Set-Content -Path $profile

# update starship config
