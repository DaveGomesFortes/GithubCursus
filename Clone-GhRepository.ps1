$NameRepo = Read-Host "Vul de naam in van de repository(gebruik OWNER/REPO syntax of gebruik de URL)"

if ($NameRepo -eq "") {
    Write-Error "Geen naam ingevuld. Naam is verplicht"
    exit
}

gh repo clone $NameRepo