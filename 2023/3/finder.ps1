$input = get-content .\input.txt

# make $input into a 2d array
$grid = @()
foreach ($line in $input) {
    $grid += ,$line.ToCharArray()
}

#loop through the input and find all symbols that arent '.' or numbers
$symbols = @()
for ($i = 0; $i -lt $grid.length; $i++) {
    for ($j = 0; $j -lt $grid[$i].length; $j++) {
        if ($grid[$i][$j] -ne '.' -and $grid[$i][$j] -notmatch '[0-9]') {
            $symbols += $grid[$i][$j]
            $symbols = $symbols | select -Unique
        }
    }
}



# loop through the grid and find all the numbers, they can have several digits
# if a number is found, check if it is valid, if it is, add it to the numbers array
$numbers = @()
for ($i = 0; $i -lt $grid.length; $i++) {
    for ($j = 0; $j -lt $grid[$i].length; $j++) {
        if ($grid[$i][$j] -match '[0-9]') {
            write-host "found a number at $i $j"
            [string]$number = "$([int]$grid[$i][$j])"
            $k = 1
            while ($grid[$i][$j+$k] -match '[0-9]') {
                $number = $number+"$([int]$grid[$i][$j+$k])"
                $k++
            }
            $i = $i+$k-1
            $number = [int]$number
            write-host "number is $number"
            #check if the number is valid
            #it is valid if there is a symbol on any side of it, up, down, left or right or diagonally, make sure that edges of the grid are handled correctly
            $valid = $false
            if ($i -gt 0) {
                if ($grid[$i-1][$j] -in $symbols) {
                    $valid = $true
                }
            }
            if ($i -lt $grid.length-1) {
                if ($grid[$i+1][$j] -in $symbols) {
                    $valid = $true
                }
            }
            if ($j -gt 0) {
                if ($grid[$i][$j-1] -in $symbols) {
                    $valid = $true
                }
            }
            if ($j -lt $grid[$i].length-1) {
                if ($grid[$i][$j+1] -in $symbols) {
                    $valid = $true
                }
            }
            if ($i -gt 0 -and $j -gt 0) {
                if ($grid[$i-1][$j-1] -in $symbols) {
                    $valid = $true
                }
            }
            if ($i -gt 0 -and $j -lt $grid[$i].length-1) {
                if ($grid[$i-1][$j+1] -in $symbols) {
                    $valid = $true
                }
            }
            if ($i -lt $grid.length-1 -and $j -gt 0) {
                if ($grid[$i+1][$j-1] -in $symbols) {
                    $valid = $true
                }
            }
            if ($i -lt $grid.length-1 -and $j -lt $grid[$i].length-1) {
                if ($grid[$i+1][$j+1] -in $symbols) {
                    $valid = $true
                }
            }

            if ($valid) {
                $numbers += $number
                
            }



        }
    }
}
