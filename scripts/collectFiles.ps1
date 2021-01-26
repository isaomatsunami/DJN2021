# フォルダにある.txtファイルを探し
# そのコピーをcollectedDirectoryに集める
# $targetDirectoryの中に$collectedDirectoryがあると、コピーしたものが再びコピーの対象になるので
# エラーが出るかもしれない。コピー先のディレクトリは対象ディレクトリの外に置くべき
# 別のフォルダに同じ名前のファイルがある場合、上書きされてしまう（避けたい場合は名前を変更すべきかもしれない）

$targetDirectory = "scripts"
$collectedDirectory = "collectedFiles"

mkdir $collectedDirectory

Get-ChildItem -Path $targetDirectory -Recurse | 
    Where-Object {$_.Extension.ToLower() -eq ".txt"} | 
    ForEach-Object{
        Write-Output ("copying...  " + $_.Name)
        Copy-Item $_.Fullname ($collectedDirectory + "/" + $_.Name)
    }