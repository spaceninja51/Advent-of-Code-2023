<# Test Data:
Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green

Games 1,2,and 5 are possible so should get 8

Determine which games would have been possible if the bag had been loaded with only 12 red cubes, 13 green cubes, and 14 blue cubes. What is the sum of the IDs of those games? #>

$text = Get-Content "C:\Users\cwg24\OneDrive\Desktop\Nerd Shit\Coding\Advent-of-Code-2023\Day 2\2-1 and 2-2 Input.txt"

# Set maximum color values
$rmax = 12
$gmax = 13
$bmax = 14
# Set maximum total cubes by adding the max of each color
$tmax = $rmax + $gmax + $bmax

# Iterate through each line of the input text and break the line into the two strings made of the text on either side of :
foreach ($game in $text) {

    $lineText = $game.split(":")
    
    # Set the game's ID by refereincing the text before :, then removing "Game "
    [int] $gameID = $lineText[0].Trim("Game ")

    # Break the text after : into individual rounds
    $rounds = $lineText[1].split(";")

    # Iterate through each round in a line and break it into individual counts of colors
    foreach ($round in $rounds) {

        $counts = $round.Split(",")
        
        #Iterate through each count in a round and set each color's corresponding value and calculate shown totals for a round
        foreach ($count in $counts) {
            switch ($count.contains("red"), $count.contains("green"), $count.contains("blue")) {
                ($count.contains("red")) {
                    $red = $count.trimend(" red")
                }
                ($count.contains("green")) {
                    $green = $count.trimend(" green")
                }
                ($count.contains("blue")) {
                    $blue = $count.trimend(" blue")
                }
            }
            
            # Find the round's total by adding all individual colors
            $total = $red + $green + $blue
            
            # if any values are above their defined maximums, the game is marked as invalid
            if (!($red -le $rmax) -and ($green -le $gmax) -and ($blue -le $bmax) -and ($total -le $tmax)) {
               [bool] $ValidGame = True
            }
            
            # Reset all values before moving to the next round
            $red, $green, $blue, $total = 0
        }
    }

    if ($ValidGame) {
        $answer += $gameID
        $ValidGame = False
    }
}
$answer