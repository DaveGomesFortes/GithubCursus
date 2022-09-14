$nameRepo = Read-Host "Vul de naam in van de repository(gebruik OWNER/REPO syntax of gebruik de URL)"

if ($nameRepo -eq "") {
    Write-Error "Geen naam ingevuld. Naam is verplicht"
    Write-Error "Powershell sluit af in 7 seconden"
    Start-Sleep -Seconds 7
    exit
}

gh repo clone $nameRepo