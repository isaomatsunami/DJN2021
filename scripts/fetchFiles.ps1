# 日本卸電力取引所が公開している電力料金のスポット価格は
# http://jepx.org/data/20210114.csv のように日付名のcsvファイルとして
# 翌日にはネット経由で公開されている。

mkdir -Force PowerPrices;

$dt = [DateTime]::ParseExact("2021-01-01","yyyy-MM-dd", $null)
$today = Get-Date
while ($dt -lt $today) {
    $url = "http://jepx.org/data/" + $dt.ToString("yyyyMMdd") + ".csv"
    $outputFilename = "PowerPrices/" + $dt.ToString("yyyyMMdd") + ".csv"
    echo ("calling Invoke-WebRequest " + $url + " -OutFile " + $outputFilename)
    Invoke-WebRequest $url -OutFile $outputFilename
    Start-Sleep -s 5
    $dt = $dt.AddDays(1)
}
