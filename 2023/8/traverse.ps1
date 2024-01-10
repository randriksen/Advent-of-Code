$inputdata = get-content .\input.txt

$steps = $inputdata[0].ToCharArray()

$inputdata = $inputdata[2..$inputdata.length]

#make a dictionary where id is the key and the value is left and right
$map = @{}


foreach ($line in $inputdata) {
  
    $id = $line.split(" = ")[0]
    $left = $line.split(" = ")[1].TrimStart("(").TrimEnd(")").split(",")[0].trim(" ")
    $right = $line.split(" = ")[1].TrimStart("(").TrimEnd(")").split(",")[1].trim(" ")
    #write-host "id: $id left: $left right: $right"
    
    #make a dictionary where id is the key and the value is left and right
    $map.Add($id,[PSCustomObject]@{
         left = $left
         right = $right
     })
}

$operations=0
$index = "AAA"
$j = 1
while ($index -ne "ZZZ") {
    
    foreach ($direction in $steps) {
    $operations +=1
   
    
    $current = $direction
    
    if ($current -eq "L") {
        $index = $map["$index"].left
    }
    else {
        $index = $map["$index"].right
    }
   
    write-host "index: $index, current: $current"
  
    

} 
}
write-host $operations