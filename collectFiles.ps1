# フォルダにある.txtファイルを探し
# そのコピーをcollectedDirectoryに集める

$targetDirectory = "./"
$collectedDirectory = "collectedFiles"

mkdir $collectedDirectory

Get-ChildItem -Path $targetDirectory -Recurse | 
    Where-Object {$_.Extension.ToLower() -eq ".txt"} | 
    ForEach-Object{
        Write-Output "copying...  " + $_
        Copy-Item $_ ($collectedDirectory + "/" + [System.IO.Path]::GetFileName($_))
    }