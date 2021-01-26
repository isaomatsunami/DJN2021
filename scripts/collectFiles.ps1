# フォルダにある.txtファイルを探し
# そのコピーをcollectedDirectoryに集める
# $targetDirectoryの中に$collectedDirectoryがあると、コピーしたものが再びコピーの対象になるので
# エラーが出るかもしれない。コピー先のディレクトリは対象ディレクトリの外に置くべき

$targetDirectory = "scripts"
$collectedDirectory = "collectedFiles"

mkdir $collectedDirectory

Get-ChildItem -Path $targetDirectory -Recurse | 
    Where-Object {$_.Extension.ToLower() -eq ".txt"} | 
    ForEach-Object{
        Write-Output ("copying...  " + $_.Name)
        Copy-Item $_.Fullname ($collectedDirectory + "/" + $_.Name)
    }