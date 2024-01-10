$inputdata = get-content .\input.txt
$seeds = $inputdata[0].split(":")[1].trim(" ").split(" ")

