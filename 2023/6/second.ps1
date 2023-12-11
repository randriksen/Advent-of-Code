$inputdata = get-content .\input.txt

$times = $inputdata[0].split(":")[1].trim(" ").replace("     ","").split(",")
$distances = $inputdata[1].split(":")[1].trim(" ").replace("   ","").split(",")

$results =@()

    $max = [double]$times.trim(" ")
    $toBeat=[double]$distances.trim(" ")

    $waysToWin = 0
    for ($j = 0; $j -lt $max; $j++) {
        $d = $j*($max-$j)
      #  write-host "distance: $d, tobeat: $toBeat"
        if ($d -gt $toBeat) {
            $waysToWin++
          #  write-host "won"
        } else{
          #  write-host "lost"
        }
    }
    $results += $waysToWin


$second = 1
foreach ($r in $results) {
    $second = $second*$r
}
$second

