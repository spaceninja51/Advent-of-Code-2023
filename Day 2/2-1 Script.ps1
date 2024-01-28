<# Test Data:
Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green

Games 1,2,and 5 are possible so should get 8

Determine which games would have been possible if the bag had been loaded with only 12 red cubes, 13 green cubes, and 14 blue cubes. What is the sum of the IDs of those games? #>

$file = "C:\Users\cwg24\OneDrive\Desktop\Nerd Shit\Coding\Advent-of-Code-2023\Day 2\2-1 and 2-2 Input.txt"

$text = Get-Content $file

<# $text = "Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green" #>

# Set maximum color values
$rmax = 12
$gmax = 13
$bmax = 14
# Set maximum total cubes by adding the max of each color
$tmax = $rmax + $gmax + $bmax

# Iterate through each line of the input text and break the line into the two strings made of the text on either side of :
foreach ($entry in $text) {
    $lineText = $entry.split(":")
    
    # Set the game's ID by refereincing the text before :, then removing "Game "
    [int] $gameID = $lineText[0].Trim("Game ")
}