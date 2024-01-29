<# Create a class used to represent an individual round of the game #>
class Round {
    [int] $ID
    [int] $red
    [int] $green
    [int] $blue
    #[int] $total
}

<# create a class used to represent each game (line) and track its color reauirements while storing each round's data #>
class Game {
    [int] $ID
    [int] $bmin = 0
    [int] $gmin = 0
    [int] $rmin = 0
    [Array] $Rounds
}
<# initialize variables #>
$gameID, $answer1 = 0
<# set desired red, green, and blue maximum values #>
#$rmax = 12
#$gmax = 13
#$bmax = 14
#$tmax = $rmax + $gmax + $bmax

<# data to be processed #>
$text = Get-Content "C:\Users\cwg24\OneDrive\Desktop\Nerd Shit\Scripting\Advent-of-Code-2023\Day 2\Input.txt"

<# Iterate through each line of the input text and break the line into the two strings made of the text on either side of :, resetting the status of invalid on each new line
 / from Part 1 #>

foreach ($line in $text.Split([Environment]::NewLine, [StringSplitOptions]::RemoveEmptyEntries)) {
    
    $currentGame = [Game]::new()
    #$invalid = 0
    $lineText = $line.Split(":")
    $currentGame.ID = $lineText[0] -replace '[a-zA-Z]',''
    $roundNum = 0

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
                        #$invalid = 1
                        $currentGame.rmin = $countNo
                    }
                }
                "green" {
                    $currentRound.green = $countNo
                    if ($countNo -gt $currentGame.gmin) {
                        #$invalid = 1
                        $currentGame.gmin = $countNo
                    }
                }
                "blue" {
                    $currentRound.blue = $countNo
                    if ($countNo -gt $currentGame.bmin) {
                        #$invalid = 1
                        $currentGame.bmin = $countNo
                    }
                    
                }
            }
        }
        
        <# adds the filled out current round to an array of rounds for the current game#>
        $currentGame.Rounds += $currentRound
        
        <# calculate total cubes shown in a round #>
        #$round.total = $round.red + $round.green + $round.blue
        
        #if ($round.total -gt $tmax) {
        #   $invalid = 1
        #}
        
    }
    
    $answer2 += $currentGame.rmin * $currentGame.gmin * $currentGame.bmin
    <# checks whether a game (line) has been marked as invalid, if it hasn't add that game's ID to a running total #>
    #switch ($invalid) {
    #    0 {
    #        $gameID = $lineText[0] -replace '[a-zA-Z]',''
    #        $answer1 += $gameID
    #        break
    #    }
    #    1 {
    #        break
    #    }
    #}

    <# Now to multiply each power#>
}
$answer2