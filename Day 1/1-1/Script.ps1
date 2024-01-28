# Path to the text file
$file = "C:\Users\cwg24\OneDrive\Desktop\Coding\Advent of Code 2023\Day 1\input.txt"

# Read the file content as an array of lines
$dataSet = Get-Content -Path $file
$total = 0

foreach ($line in $dataSet) {
    
    $numbers = $line -replace '\D'
    
    $firstChar = $numbers[0]
    $lastChar = $numbers[-1]
    
    $total += "$firstChar$lastChar"

}


Write-Output $total