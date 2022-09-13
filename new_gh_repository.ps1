$ifName = Read-Host "Vul de naam in van je repository"
$switchVisibility = Read-Host "Wilt u een private of public repository (typ 'y' voor private of 'n' voor public)"
$switchDescription = Read-Host "Typ hier de description (typ niks als u geen description wilt)"
$description = "--description"

if ("" -eq $ifName) {
    Write-Output "Error: Geen naam ingevuld. Naam is verplicht"
    Write-Output "Powershell sluit af in 7 seconden"
    Start-Sleep -Seconds 7
    exit
}else {
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
    default {"Error: Verkeerde private of public input (typ 'y' voor private of 'n' voor public)"; "Powershell sluit af in 7 seconden"; Start-Sleep -Seconds 7; exit}
}

switch ($switchDescription) {
    "" {$flagDescription = ""; $description = $null}
    Default {$flagDescription = $switchDescription}
}

gh repo create $flagName --$flagVisibility $description $flagDescription