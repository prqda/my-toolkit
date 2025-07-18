# Imposta la cartella di destinazione per i download
$downloadFolder = "$env:USERPROFILE\Downloads\prada toolkit"
if (!(Test-Path $downloadFolder)) {
    New-Item -ItemType Directory -Path $downloadFolder | Out-Nul
}

# Elenco dei file da scaricare
$files = @(
    "https://www.voidtools.com/Everything-1.4.1.1027.x86-Setup.exe",
    "https://www.nirsoft.net/utils/winprefetchview.zip",
    "https://github.com/spokwn/JournalTrace/releases/latest/download/JournalTrace.zip"
)

# Scarica ogni file
foreach ($file in $files) {
    $fileName = [System.IO.Path]::GetFileName(($file -split "\?")[0])
    $destination = Join-Path $downloadFolder $fileName
    try {
        Start-BitsTransfer -Source $file -Destination $destination
        Write-Host "✅ Scaricato: $fileName" -ForegroundColor Green
    } catch {
        Write-Host "❌ Errore nel download: $fileName" -ForegroundColor Red
    }
}