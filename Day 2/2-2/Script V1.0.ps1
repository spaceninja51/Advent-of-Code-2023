<# Create a class used to represent an individual round of the game #>
class Round {
    [int] $red
    [int] $green
    [int] $blue
}

<# create a class used to represent each game (line) and track its color reauirements while storing each round's data #>
class Game {
    [int] $ID
    [int] $bmin
    [int] $gmin
    [int] $rmin
    [int] $Power
    [Array] $Rounds
}
<# initialize variables #>
$answer2 = 0

<# data to be processed #>
$file = "C:\Users\Curtis\OneDrive\Desktop\Coding\Scripting\Advent of Code 2023\Advent-of-Code-2023\Day 2\Input.txt"
$text = Get-Content $file

<# Looping through each game #>
foreach ($line in $text.Split([Environment]::NewLine, [StringSplitOptions]::RemoveEmptyEntries)) {
    <# Iterate through each line of the input text and break the line into the two strings made of the text on either side of :.#>
    $lineText = $line.Split(":")

    <# Create new Game object at every new line set its ID based on that game's number#>
    $currentGame = [Game]::new()
    $currentGame.ID = $lineText[0] -replace '[a-zA-Z]',''

    <# resetting variables for the next game #>
    $rmin, $gmin, $bmin = 0
    
    <# Looping through each round#>
    foreach($pull in $lineText[1].Split(";")) {
        <# create a new round object with each ; #>
        $currentRound = [Round]::new()

        <# Loop through each count in a round #>
        foreach ($count in $pull.Split(",").Trim()) {
            
            <# Split the counts into number:color and set variables like $countColor:$countNo #>
            [int] $countNo = $count.Split(" ")[0].Trim()
            $countColor = $count.Split(" ")[1].Trim()

            <# find the color the number goes to and set its corresponding value #>
            switch ($countColor) {
                "red" {
                    $currentRound.red = $countNo
                    }
                "green" {
                    $currentRound.green = $countNo
                }
                "blue" {
                    $currentRound.blue = $countNo
                    }
                }
            }
        }
        
        <# adds $currentRound to an array of rounds for the current game #>
        $currentGame.Rounds += $currentRound
        $currentGame.Power = $currentGame.rmax * $currentGame.gmax * $currentGame.bmax
        $answer2 += $currentGame.Power
    }