# Imposta la cartella di destinazione per i download
$downloadFolder = "$env:USERPROFILE\Downloads\prada's toolkit"
if (!(Test-Path $downloadFolder)) { New-Item -ItemType Directory -Path $downloadFolder }

# Elenco dei file da scaricare
$files = @(
    "https://github.com/spokwn/JournalTrace/releases/download/1.2/JournalTrace.exe",
    "https://www.voidtools.com/Everything-1.4.1.1027.x86-Setup.exe",
    "https://www.nirsoft.net/utils/winprefetchview.zip"
)

# Scarica ogni file
foreach ($file in $files) {
    $fileName = [System.IO.Path]::GetFileName(($file -split "\?")[0])  # Pulisce eventuali parametri URL
    $destination = "$downloadFolder\$fileName"
    try {
        Start-BitsTransfer -Source $file -Destination $destination
        Write-Host "✅ Scaricato: $fileName" -ForegroundColor Green
    } catch {
        Write-Host "❌ Errore nel download: $fileName" -ForegroundColor Red
    }
}
