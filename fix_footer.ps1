$files = Get-ChildItem "D:\CodeWhale便携\_fix4_clone" -Recurse -Filter "*.md"
foreach ($f in $files) {
    $content = [System.IO.File]::ReadAllText($f.FullName, [System.Text.Encoding]::UTF8)
    if ($content.Contains("非绝对正确")) {
        $content = $content.Replace("*子星明团队 · 仅供参考借鉴，非绝对正确*", "*子星明团队 · 仅供参考借鉴*")
        [System.IO.File]::WriteAllText($f.FullName, $content, [System.Text.Encoding]::UTF8)
        Write-Host ("FIXED: " + $f.Name)
    }
}
Write-Host "ALL DONE"