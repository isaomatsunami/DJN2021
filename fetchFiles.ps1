# 日本卸電力取引所が公開している電力料金のスポット価格は
# http://jepx.org/data/20210114.csv のように日付名のcsvファイルとして
# 翌日にはネット経由で公開されている。

# ファイルを保存するディレクトリを作る
mkdir -Force PowerPrices;

# 収集したい初日
$dt = [DateTime]::ParseExact("2021-01-01","yyyy-MM-dd", $null)
$today = Get-Date
while ($dt -lt $today) {
    # 取得したいファイルのURL
    $url = "http://jepx.org/data/" + $dt.ToString("yyyyMMdd") + ".csv"
    # 保存したい名前
    $outputFilename = "PowerPrices/" + $dt.ToString("yyyyMMdd") + ".csv"
    # 進行状況を表示
    echo ("calling Invoke-WebRequest " + $url + " -OutFile " + $outputFilename)
    Invoke-WebRequest $url -OutFile $outputFilename
    $dt = $dt.AddDays(1)
}
