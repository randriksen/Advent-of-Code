$input = get-content -path input.txt

$possibleGames = @()
$powers = @()

$reds = 12
$greens = 13
$blues = 14

foreach ($line in $input) {

    #$line = "game 1: 8 green; 5 green, 6 blue, 1 red; 2 green, 1 blue, 4 red; 20 green, 1 red, 2 blue; 2 blue, 3 red"
    $gameID = $line.split(":")[0].split(" ")[1]
    $games = $line.split(":")[1].split(";")    
    #write-host $games
    $possible = $true
    $maxRed = 0
    $maxGreen = 0
    $maxBlue = 0

    # if game 1 has a number of balls higher than the given numbers $reds, $greens, $blues, then the games are not possible. the format of a game is 8 green; 5 green, 6 blue, 1 red; 2 green, 1 blue, 4 red; 10 green, 1 red, 2 blue; 2 blue, 3 red
    foreach ($game in $games) {
        #write-host $game
        foreach ($ball in $game.split(",")) {
            
            $color = $ball.split(" ")[2]
           # write-host "color: $color"
            $number = $ball.split(" ")[1]
           # write-host "number: $number"
            if ($color -eq "red") {
                if ([int]$number -gt $reds) {
                    $possible = $false
                   # break
                }
                if ([int]$number -gt $maxRed) {
                    $maxRed = [int]$number
                }
            }
            if ($color -eq "green") {
                if ([int]$number -gt $greens) {
                    $possible = $false
                   # break
                }
                if ([int]$number -gt $maxGreen) {
                    $maxGreen = [int]$number
                }
            }
            if ($color -eq "blue") {
                if ([int]$number -gt $blues) {
                    $possible = $false
                 #   break
                }
                if ([int]$number -gt $maxBlue) {
                    $maxBlue = [int]$number
                }
            }
    
        }
        if ($maxRed -eq 0) {
            $maxRed = 1
        }
        if ($maxGreen -eq 0) {
            $maxGreen = 1
        }
        if ($maxBlue -eq 0) {
            $maxBlue = 1
        }
        $power = $maxRed * $maxGreen * $maxBlue
      
       # write-host "power: $power"
       
    }
    
    $powers += $power
    if ($possible) {
        $possibleGames += $gameID
        
    }
    

}

$possibleGames | Measure-Object -Sum
$powers | Measure-Object -Sum
