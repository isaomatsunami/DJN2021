# フォルダにある.txtファイルを探し
# そのコピーをcollectedDirectoryに集める

$targetDirectory = "./"
$collectedDirectory = "collectedFiles"

mkdir $collectedDirectory

Get-ChildItem -Path $targetDirectory -Recurse | 
    Where-Object {$_.Extension.ToLower() -eq ".txt"} | 
    ForEach-Object{
        Write-Output ("copying...  " + ("./" + $collectedDirectory + "/" + $_.Name))
        Copy-Item $_ ("./" +$collectedDirectory + "/" + $_.Name)
    }