$IfName = Read-Host "Geef de repository een naam"
$SwitchVisibility = Read-Host "Selecteer een private of public repository ('y' voor private,'n' voor public)"
$SwitchDescription = Read-Host "Geef hier de description (optioneel)"
$Description = "--description"

if ($SwitchDescription -eq "") {
    $Description = ""
}

if ("" -eq $IfName) {
    Write-Error "Geen naam ingevuld. Naam is verplicht"
    exit
}
else {
    $FlagName = $IfName
}

switch ($SwitchVisibility) {
    { @("y","Y","yes","Yes","YES","j","J","ja","Ja","JA","private","Private","PRIVATE") -contains $_} {$FlagVisibility = "private"}
    { @("n","N","no","No","NO","nee","Nee","NEE","public","Public","PUBLIC") -contains $_} {$FlagVisibility = "public"}
    default {Write-Error "Verkeerde private of public input ('y' voor private 'n' voor public)"; exit}
}

gh repo create $FlagName --$FlagVisibility $Description $SwitchDescription