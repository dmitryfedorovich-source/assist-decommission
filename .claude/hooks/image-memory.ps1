$json = [Console]::In.ReadToEnd() | ConvertFrom-Json
$fp = $json.tool_input.file_path
if (-not $fp) { exit 0 }
if ($fp -notmatch '\.(jpg|jpeg|png|gif|svg)$') { exit 0 }
if ($fp -notmatch '[/\\]input[/\\]') { exit 0 }

$base = [System.IO.Path]::GetFileNameWithoutExtension($fp)
$safe = ($base -replace '[^a-zA-Z0-9]', '_').ToLower()

if ($fp -match '^(.+)[/\\]input[/\\]') {
    $projectRoot = $Matches[1]
} else { exit 0 }

$memFile = [System.IO.Path]::Combine($projectRoot, 'memory', "img_$safe.md")

if (Test-Path $memFile) {
    [Console]::Out.WriteLine((@{
        continue    = $false
        stopReason  = "Image already processed — use memory/img_$safe.md instead of re-reading."
    } | ConvertTo-Json -Compress))
    exit 2
} else {
    [Console]::Out.WriteLine((@{
        systemMessage = "REMINDER: After reading this image, save extracted knowledge to memory/img_$safe.md"
    } | ConvertTo-Json -Compress))
}
