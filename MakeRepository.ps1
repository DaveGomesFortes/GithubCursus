$name = Read-Host "Vul de naam in van je repository"
$flagVisibility = Read-Host "Wilt u een private of public repository (typ 'public' of 'private')"
$flagDescription = Read-Host "Typ hier de description(typ niks als u geen description wilt)"
gh repo create $name --$flagVisibility --description $flagdescription