
$sourceFolder = "W:\opus"
$destinationFolder = "W:\convertido"

$files = Get-ChildItem -Path $sourceFolder -Filter *.opus


$totalFiles = $files.Count
$currentFile = 0


If (!(Test-Path -Path $destinationFolder)) {
    New-Item -ItemType Directory -Path $destinationFolder
}


foreach ($file in $files) {
    $currentFile++
    
    
    $outputFile = Join-Path $destinationFolder ("{0}.mp3" -f $file.BaseName)
    
 
    ffmpeg -i $file.FullName -codec:a libmp3lame $outputFile
    
   
    Write-Progress -Activity "Convirtiendo archivos" -Status "Convirtiendo $($file.Name)" `
        -PercentComplete (($currentFile / $totalFiles) * 100)
}

Write-Host "Conversión completada. Todos los archivos se han movido a $destinationFolder."
