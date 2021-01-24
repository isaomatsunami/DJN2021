# フォルダにある.pngファイルを探し
# サイズが1MB以上ある写真だけ
# jpgに変換してcollectedDirectoryに保存する

$targetDirectory = "./"
$collectedDirectory = "jpegFiles"

mkdir $collectedDirectory

Get-ChildItem -Path $targetDirectory -Recurse | 
    Where-Object {$_.Extension.ToLower() -eq ".png"} | 
    ForEach-Object{
        if($_.Length -gt 1000000){
            Write-Output ("saving as jpg ...  " + $_.Name)
            magick convert $_.FullName ($collectedDirectory + "/" + ($_.Name -replace ".png",".jpg"))
        }
    }