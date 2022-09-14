$email = Read-Host "Vul een email in"
$username = Read-Host "Vul de 'windows user' naam in(bevindt zich op C:/Users/*De Naam*)"

if (! (Test-Path("~/.ssh/id_ed25519.pub"))) {
    ssh-keygen -t ed25519 -C $email
}else {
    Write-Error "Ssh-key bestaat al"
}

Get-Service ssh-agent | Set-Service -StartupType Automatic
Start-Service ssh-agent 
Get-Service ssh-agent 
ssh-add C:\Users\$username\.ssh\id_ed25519