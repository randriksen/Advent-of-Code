$inputdata = get-content .\input.txt

$times = $inputdata[0].split(":")[1].trim(" ").replace("     ",",").split(",")
$distances = $inputdata[1].split(":")[1].trim(" ").replace("   ",",").split(",")

$results =@()
for ($i = 0; $i -lt $times.length; $i++) {
    $max = $times[$i]
    $toBeat=[int]$distances[$i]

    $waysToWin = 0
    for ($j = 0; $j -lt $max; $j++) {
        $d = $j*($max-$j)
        write-host "distance: $d, tobeat: $toBeat"
        if ($d -gt $toBeat) {
            $waysToWin++
            write-host "won"
        } else{
            write-host "lost"
        }
    }
    $results += $waysToWin

}
$first = 1
foreach ($r in $results) {
    $first = $first*$r
}
$first

