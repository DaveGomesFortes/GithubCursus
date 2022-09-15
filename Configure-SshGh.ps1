$Email = Read-Host "Vul een email in"

try {
    $null = [mailaddress]$Email
    $ValidEmail = $Email
}
catch {
    Write-Error "Ongeldig email"
    exit
}

if (! (Test-Path("~\.ssh\id_ed25519.pub"))) {
    ssh-keygen -t ed25519 -C $ValidEmail
}else {
    Write-Error "Ssh-key bestaat al" ; exit    
}

Get-Service ssh-agent | Set-Service -StartupType Automatic
Start-Service ssh-agent
Get-Service ssh-agent
ssh-add C:\Users\$env:UserName\.ssh\id_ed25519
Get-Content C:\Users\$env:UserName\.ssh\id_ed25519.pub | Set-Clipboard