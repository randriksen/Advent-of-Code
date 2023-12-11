$inputdata = get-content .\input.txt

$results = @()

$line = $inputdata[0]
foreach ($line in $inputdata) {
    $cardnumber = $line.split(":")[0].replace("   ",",").split(",")[1]
    $winners = $line.split(":")[1].split("|")[0].trim().replace("  "," ").split(" ")
    $numbers = $line.split(":")[1].split("|")[1].trim().replace("  "," ").split(" ")

    $match = 0
    foreach ($n in $numbers) {
        if ($winners -contains $n) {
            $match++
        }
    }
    if ($match -gt 0) {
   
        $power = 1
        for ($i = 1;$i -lt $match; $i++){
          
            $power = $power * 2
        }
        $results += $power
    }
}

$first = 0
foreach ($r in $results) {
    $first += $r
}
$first