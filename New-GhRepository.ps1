$ifName = Read-Host "Geef de repository een naam"
$switchVisibility = Read-Host "Selecteer een private of public repository ('y' voor private,'n' voor public)"
$switchDescription = Read-Host "Geef hier de description (optioneel)"
$description = "--description"

if ($switchDescription -eq "") {
    $description = ""
}

if ("" -eq $ifName) {
    Write-Error "Geen naam ingevuld. Naam is verplicht"
    Write-Error "Powershell sluit af in 7 seconden"
    Start-Sleep -Seconds 7
    exit
}
else {
    $flagName = $ifName
}

switch ($switchVisibility) {
    y {$flagVisibility = "private"}
    n {$flagVisibility = "public"}
    Y {$flagVisibility = "private"}
    N {$flagVisibility = "public"}
    yes {$flagVisibility = "private"}
    no {$flagVisibility = "public"}
    Yes {$flagVisibility = "private"}
    No {$flagVisibility = "public"}
    YES {$flagVisibility = "private"}
    NO {$flagVisibility = "public"}
    j {$flagVisibility = "private"}
    J {$flagVisibility = "private"}
    ja {$flagVisibility = "private"}
    nee {$flagVisibility = "public"}
    Ja {$flagVisibility = "private"}
    Nee {$flagVisibility = "public"}
    JA {$flagVisibility = "private"}
    NEE {$flagVisibility = "public"}
    private {$flagVisibility = "private"}
    public {$flagVisibility = "public"}
    Private {$flagVisibility = "private"}
    Public {$flagVisibility = "public"}
    PRIVATE {$flagVisibility = "private"}
    PUBLIC {$flagVisibility = "public"}
    default {Write-Error "Verkeerde private of public input ('y' voor private 'n' voor public)"; Write-Error "Powershell sluit af in 7 seconden"; Start-Sleep -Seconds 7; exit}
}

gh repo create $flagName --$flagVisibility $description $switchDescription