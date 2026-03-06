# Serveur HTTP simple pour juliebergeronhypnose
$port = 3000
$root = "C:\hypnose"
$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add("http://localhost:$port/")
$listener.Start()
Write-Host "Serveur demarré sur http://localhost:$port" -ForegroundColor Green
Write-Host "Appuyez sur Ctrl+C pour arrêter." -ForegroundColor Yellow

while ($listener.IsListening) {
    $context = $listener.GetContext()
    $request = $context.Request
    $response = $context.Response

    $urlPath = $request.Url.LocalPath
    if ($urlPath -eq "/") { $urlPath = "/index.html" }

    $filePath = Join-Path $root $urlPath.TrimStart("/").Replace("/", "\")

    if (Test-Path $filePath -PathType Leaf) {
        $ext = [System.IO.Path]::GetExtension($filePath).ToLower()
        $mimeTypes = @{
            ".html" = "text/html; charset=utf-8"
            ".css"  = "text/css; charset=utf-8"
            ".js"   = "application/javascript; charset=utf-8"
            ".png"  = "image/png"
            ".jpg"  = "image/jpeg"
            ".jpeg" = "image/jpeg"
            ".gif"  = "image/gif"
            ".svg"  = "image/svg+xml"
            ".ico"  = "image/x-icon"
            ".woff" = "font/woff"
            ".woff2"= "font/woff2"
        }
        $mime = $mimeTypes[$ext]
        if (-not $mime) { $mime = "application/octet-stream" }
        $bytes = [System.IO.File]::ReadAllBytes($filePath)
        $response.ContentType = $mime
        $response.ContentLength64 = $bytes.Length
        $response.OutputStream.Write($bytes, 0, $bytes.Length)
    } else {
        $response.StatusCode = 404
        $msg = [System.Text.Encoding]::UTF8.GetBytes("404 - Fichier non trouvé: $urlPath")
        $response.ContentLength64 = $msg.Length
        $response.OutputStream.Write($msg, 0, $msg.Length)
    }
    $response.OutputStream.Close()
}
