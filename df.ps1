# Definir las carpetas
$sourceFolder = "W:\opus"
$destinationFolder = "W:\convertido"

# Obtener todos los archivos .opus en la carpeta de origen
$files = Get-ChildItem -Path $sourceFolder -Filter *.opus

# Número total de archivos
$totalFiles = $files.Count
$currentFile = 0

# Crear la carpeta de destino si no existe
If (!(Test-Path -Path $destinationFolder)) {
    New-Item -ItemType Directory -Path $destinationFolder
}

# Recorrer cada archivo y convertirlo a mp3
foreach ($file in $files) {
    $currentFile++
    
    # Definir la ruta de salida para el archivo .mp3
    $outputFile = Join-Path $destinationFolder ("{0}.mp3" -f $file.BaseName)
    
    # Ejecutar FFmpeg para convertir .opus a .mp3
    ffmpeg -i $file.FullName -codec:a libmp3lame $outputFile
    
    # Mostrar barra de progreso
    Write-Progress -Activity "Convirtiendo archivos" -Status "Convirtiendo $($file.Name)" `
        -PercentComplete (($currentFile / $totalFiles) * 100)
}

Write-Host "Conversión completada. Todos los archivos se han movido a $destinationFolder."
