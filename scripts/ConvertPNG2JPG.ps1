# PNGsフォルダにあるpng写真をjpg写真に変換する

$targetDirectory = "PNGs"
echo ($PSScriptRoot + "\PNGs")

Get-ChildItem -Path ($PSScriptRoot + "\" + $targetDirectory) -Recurse | 
    Where-Object {$_.Extension.ToLower() -eq ".png"} | 
    ForEach-Object{
        Write-Output ("converting...  " + $_.FullName)
        Write-Output ($PSScriptRoot + "\JPGs\" + ($_.Name -replace ".png", ".jpg"))
        magick convert $_.FullName ($PSScriptRoot + "\JPGs\" + ($_.Name -replace ".png", ".jpg"))
    }