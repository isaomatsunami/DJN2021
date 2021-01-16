# フォルダにある.csvファイルを探し
# mergedCSVに一本化する（追記リダイレクトに注意）

$targetDirectory = "PowerPrices"
$mergedCSV = "power_prices_2021.csv"

Get-ChildItem -Path $targetDirectory | 
    Where-Object {$_.Extension.ToLower() -eq ".csv"} | 
    ForEach-Object{
        Write-Output "copying...  " + $_.FullName
        cat $_.FullName >> $mergedCSV
    }