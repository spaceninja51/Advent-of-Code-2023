<# Create a class used to represent an individual round of the game #>
class Round {
    [int] $ID
    [int] $red
    [int] $green
    [int] $blue
}

<# create a class used to represent each game (line) and track its color reauirements while storing each round's data #>
class Game {
    [int] $ID
    [int] $bmin = 0
    [int] $gmin = 0
    [int] $rmin = 0
    [int] $Power = 0
    [Array] $Rounds
}
<# initialize variables #>
$gameID, $answer1 = 0

<# data to be processed #>
$file = "C:\Users\Curtis\OneDrive\Desktop\Coding\Scripting\Advent of Code 2023\Advent-of-Code-2023\Day 2\Input.txt"
$text = Get-Content $file

<# Iterate through each line of the input text and break the line into the two strings made of the text on either side of : #>

foreach ($line in $text.Split([Environment]::NewLine, [StringSplitOptions]::RemoveEmptyEntries)) {
    
    $currentGame = [Game]::new()
    $lineText = $line.Split(":")
    $currentGame.ID = $lineText[0] -replace '[a-zA-Z]',''
    $roundNum, $rmin, $gmin, $bmin = 0

    foreach($pull in $lineText[1].Split(";")) {
        <# create a new round object after each ;. For part 2, keep track of round number as well, resetting after each line #>
        $currentRound = [Round]::new()
        $roundNum++
        $currentRound.ID = $roundNum

        foreach ($count in $pull.Split(",").Trim()) {
            <# check the number to be set #>
            [int] $countNo = $count.Split(" ")[0].Trim()

            <# find the color the number goes to and compares it to the existing max for the corresponding color, if it is the new max set it as so #>
            $countColor = $count.Split(" ")[1].Trim()
            switch ($countColor) {
                "red" {
                    $currentRound.red = $countNo
                    if ($countNo -gt $currentGame.rmin) {
                        $currentGame.rmin = $countNo
                    }
                }
                "green" {
                    $currentRound.green = $countNo
                    if ($countNo -gt $currentGame.gmin) {
                        $currentGame.gmin = $countNo
                    }
                }
                "blue" {
                    $currentRound.blue = $countNo
                    if ($countNo -gt $currentGame.bmin) {
                        $currentGame.bmin = $countNo
                    }
                    
                }
            }
        }
        
        <# adds the filled out current round to an array of rounds for the current game#>
        $currentGame.Rounds += $currentRound
        
        $currentGame.Power = $currentGame.rmin * $currentGame.gmin * $currentGame.bmin
        $answer2 += $currentGame.Power 

    }
}
