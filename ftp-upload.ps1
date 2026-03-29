$ftpHost   = "ftp://juliebergeronhypnose.com/juliebergeronhypnose.com/"
$ftpUser   = "jb_sorcellerie@juliebergeronhypnose.com"
$ftpPass   = "5R8!Na&uNkYzs`$Fy"
$localRoot = "C:\hypnose"

# Fichiers et dossiers à exclure
$exclude = @('.git', '.claude', 'node_modules', 'ftp-upload.ps1', 'make-square-logo.ps1', 'serveur-preview.bat', 'images\logo-square.png')

function Ftp-CreateDir($uri, $cred) {
    try {
        $req = [System.Net.FtpWebRequest]::Create($uri)
        $req.Method = [System.Net.WebRequestMethods+Ftp]::MakeDirectory
        $req.Credentials = $cred
        $req.UseBinary = $true
        $req.UsePassive = $true
        $req.KeepAlive = $false
        $resp = $req.GetResponse()
        $resp.Close()
    } catch { }  # Ignore si le dossier existe déjà
}

function Ftp-Upload($localFile, $remoteUri, $cred) {
    $req = [System.Net.FtpWebRequest]::Create($remoteUri)
    $req.Method = [System.Net.WebRequestMethods+Ftp]::UploadFile
    $req.Credentials = $cred
    $req.UseBinary = $true
    $req.UsePassive = $true
    $req.KeepAlive = $false
    $req.ContentLength = (Get-Item $localFile).Length

    $buf = [System.IO.File]::ReadAllBytes($localFile)
    $stream = $req.GetRequestStream()
    $stream.Write($buf, 0, $buf.Length)
    $stream.Close()

    $resp = $req.GetResponse()
    $resp.Close()
}

$cred = New-Object System.Net.NetworkCredential($ftpUser, $ftpPass)

# Récupérer tous les fichiers locaux
$allFiles = Get-ChildItem -Path $localRoot -Recurse -File | Where-Object {
    $relativePath = $_.FullName.Substring($localRoot.Length + 1)
    $skip = $false
    foreach ($ex in $exclude) {
        if ($relativePath -like "$ex*" -or $relativePath -eq $ex) { $skip = $true; break }
    }
    -not $skip
}

$total = $allFiles.Count
$i = 0

foreach ($file in $allFiles) {
    $i++
    $relativePath = $file.FullName.Substring($localRoot.Length + 1)
    $remoteUri = $ftpHost + ($relativePath -replace '\\', '/')

    # Créer les dossiers parents si nécessaire
    $relativeDir = Split-Path $relativePath -Parent
    if ($relativeDir) {
        $parts = $relativeDir -split '\\'
        $accumulated = ""
        foreach ($part in $parts) {
            $accumulated = if ($accumulated) { "$accumulated/$part" } else { $part }
            Ftp-CreateDir ($ftpHost + $accumulated) $cred
        }
    }

    Write-Host "[$i/$total] $relativePath"
    Ftp-Upload $file.FullName $remoteUri $cred
}

Write-Host ""
Write-Host "UPLOAD TERMINE - $total fichiers deployes." -ForegroundColor Green
