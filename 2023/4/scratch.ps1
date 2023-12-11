$inputdata = get-content .\input.txt

$results = @()

# a dictionary that has a number as an id and an object as a value
$cards = @{}



$line = $inputdata[0]
foreach ($line in $inputdata) {
    $cardnumber = $line.split(":")[0].replace("   "," ").replace("  "," ").split(" ")[1]
    $winners = $line.split(":")[1].split("|")[0].trim().replace("  "," ").split(" ")
    $numbers = $line.split(":")[1].split("|")[1].trim().replace("  "," ").split(" ")

    # a card object that contains has the
    $card = [PSCustomObject]@{
        cardnumber = $cardnumber
        winners = $winners
        numbers = $numbers
        count = 1
    }
    #put card into dictionary
    #write-host $card
    $cards.Add($cardnumber,$card)
    


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

for ($i = 1; $i -lt $inputdata.Count+1; $i++) {
    $card = $cards["$i"]

    $match = 0
   # write-host "card: $($card.cardnumber) i: $i"
    foreach ($n in $card.numbers) {
        if ($card.winners -contains $n) {
            $match++
        }
    }
    if ($match -gt 0) {
        for ($j = 1;$j -le $match; $j++){
            $tmp =[int]$card.cardnumber + $j
            $cards["$tmp"].count = $cards["$tmp"].count + $card.count
           # write-host $cards[($card.cardnumber + $j)]
        }
        
       
    }
}
$second = 0
foreach ($c in $cards.Values) {
    $second += $c.count
}
$second