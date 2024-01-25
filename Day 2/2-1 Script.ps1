# Path to the text file
$file = "C:\Users\cwg24\OneDrive\Desktop\Coding\Advent of Code 2023\Day 2\input.txt"

# Read the file content as an array of lines
$dataSet = Get-Content -Path $file

# 12 red cubes, 13 green cubes, and 14 blue cubes
$redMax = 12
$greenMax = 13
$blueMax = 14

foreach ($line in $dataSet) {
    [int]$gameid = 0
    # Extract just the round text
    $roundText = $line.Substring($line.indexOf(':')) -replace ': '
    Write-Output $roundText
    # Break the line down into rounds

   # Break each round into its cube counts

   # Check if they're all possible

   # If so add the game ID to a running total
   
    $gameid = $line.Substring(0,$line.indexOf(':')) -replace '\D'
}