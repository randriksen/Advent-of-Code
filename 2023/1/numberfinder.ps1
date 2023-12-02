# read the file input.txt and save it to a variable

$lines = Get-Content -Path .\input.txt
$numbers = @()

# loop through each line in the file
foreach ($line in $lines) {

    # for each line, split into an array of characters
    $forward =$line
    # loop through each character in the array, until we find a number
    $first = $null
    #in $forward  find numbers written as words and replace them with numbers
 

    $chars = $forward.ToCharArray()

    $temp =""

    foreach ($char in $chars) {
        $temp += $char
        if ($temp -match "one" -or $temp -match "two" -or $temp -match "three" -or $temp -match "four" -or $temp -match "five" -or $temp -match "six" -or $temp -match "seven" -or $temp -match "eight" -or $temp -match "nine") {
            $temp = $temp -replace "one", "1"
            $temp = $temp -replace "two", "2"
            $temp = $temp -replace "three", "3"
            $temp = $temp -replace "four", "4"
            $temp = $temp -replace "five", "5"
            $temp = $temp -replace "six", "6"
            $temp = $temp -replace "seven", "7"
            $temp = $temp -replace "eight", "8"
            $temp = $temp -replace "nine", "9"
            break
        }
    }
    $chars = $temp.ToCharArray()

    foreach ($char in $chars) {
        if ($char -match "[0-9]") {
            # when we find a number, save it to first and break out of the loop
            $first = $char
            break
        }
    }

    #backwards is the reverse of line
    $backwards = $line.ToCharArray()
    $backwards = $backwards[$backwards.Length..0]
    #turn backwards into a string
    $backwards = -join $backwards
    #in $backwards  find numbers written as words and replace them with numbers
    $chars = $backwards.ToCharArray()
    $temp =""
    foreach ($char in $chars) {
        $temp += $char
        #write-host $temp
        if ($temp -match "eno" -or $temp -match "owt" -or $temp -match "eerht" -or $temp -match "ruof" -or $temp -match "evif" -or $temp -match "xis" -or $temp -match "neves" -or $temp -match "thgie" -or $temp -match "enin") {
            $temp = $temp -replace "eno", "1"
            $temp = $temp -replace "owt", "2"
            $temp = $temp -replace "eerht", "3"
            $temp = $temp -replace "ruof", "4"
            $temp = $temp -replace "evif", "5"
            $temp = $temp -replace "xis", "6"
            $temp = $temp -replace "neves", "7"
            $temp = $temp -replace "thgie", "8"
            $temp = $temp -replace "enin", "9"
            #write-host "here"
            break
        }
    }

    $backwards = $temp
    # turn it back around
    $chars = $backwards.ToCharArray()

    #write-host $chars
      
    # loop through each character in the array backwards, until we find a number
    $last =$null
    foreach ($char in $chars) {
        if ($char -match "[0-9]") {
            # when we find a number, save it to last and break out of the loop
            $last = $char
            break
        }
    }
    # make a 2 digit number out of the first and last numbers, don't add them
    # convert first and last to integers, then multiply first by 10 and add last
    $temp = "$first$last"
   # write-host $temp
    #$number = ([int]$first * 10) + [int]$last

    #save the number to an array
    $numbers += [int]$temp


}

# print the array of numbers
#$numbers

# print the sum of the numbers
$numbers | Measure-Object -Sum 
