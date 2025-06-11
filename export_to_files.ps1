# Chemin du fichier source
$sourceFile = "C:\Users\Alexa\Desktop\PROGRAMME\EXPORT\Source.txt"
# Répertoire de sortie
$outputDir = "C:\Users\Alexa\Desktop\PROGRAMME\EXPORT\SOURCE"

# Créer le répertoire de sortie s'il n'existe pas
if (-not (Test-Path $outputDir)) {
    New-Item -ItemType Directory -Path $outputDir | Out-Null
}

# Lire toutes les lignes
$lines = Get-Content $sourceFile

$currentMember = ""
$memberLines = @()

foreach ($line in $lines) {
    if ($line -match "\*\s+MEMBRE=([A-Z0-9]+)\s+LIBRAIRIE=") {
        # Sauvegarder le membre précédent s'il y en a un
        if ($currentMember -ne "") {
            $outputPath = Join-Path $outputDir "$currentMember.txt"
            $memberLines | Set-Content -Path $outputPath -Encoding UTF8
            $memberLines = @()
        }

        # Nouveau membre détecté
        $currentMember = $matches[1]
    }
    elseif ($line -notmatch "^\*{78,}$") {
        # Ajouter les lignes hors bannière (pas les lignes "*******")
        $memberLines += $line
    }
}

# Écrire le dernier membre
if ($currentMember -ne "") {
    $outputPath = Join-Path $outputDir "$currentMember.txt"
    $memberLines | Set-Content -Path $outputPath -Encoding UTF8
}

Write-Output "Extraction terminée. Fichiers créés dans : $outputDir"
