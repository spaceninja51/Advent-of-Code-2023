# Create a class used to represent an individual round of the game
class Round {
    [int] $red
    [int] $green
    [int] $blue
    [int] $total
}

#initialize variables
$gameID, $answer = 0
# set desired red, green, and blue maximum values
$rLim = 12
$gLim = 13
$bLim = 14
# data to be processed
$text = Get-Content "C:\Users\cwg24\OneDrive\Desktop\Nerd Shit\Scripting\Advent-of-Code-2023\Day 2\Input.txt"
$text = $text.Split([Environment]::NewLine, [StringSplitOptions]::RemoveEmptyEntries)
# Iterate through each line of the input text and break the line into the two strings made of the text on either side of :
foreach ($line in $text) {
    
    $invalid = 0
    $lineText = $line.Split(":")
    [int] $rMax , $gMax , $bMax = 0

    foreach($pull in $lineText[1].Split(";")) {
        # create a new round object after each ;
        $round = [Round]::new()
        
        foreach ($count in $pull.Split(",").Trim()) {
            # check the number to be set
            [int] $countNo = $count.Split(" ")[0].Trim()

            # find the color the number goes to and set it
            $countColor = $count.Split(" ")[1].Trim()
            switch ($countColor) {
                "red" {
                    $round.red = $countNo
                    if ($countNo -gt $rLim) {
                        $invalid = 1
                    }
                    if ($countNo -gt $rMax) {
                        $rMax = $countNo
                    }
                    break
                }
                "green" {
                    $round.green = $countNo
                    if ($countNo -gt $gLim) {
                        $invalid = 1
                    }
                    if ($countNo -gt $gMax) {
                        $gMax = $countNo
                    }
                    break
                }
                "blue" {
                    $round.blue = $countNo
                    if ($countNo -gt $bLim) {
                        $invalid = 1
                    }
                    if ($countNo -gt $bMax) {
                        $bMax = $countNo
                    }
                    break
                }
            }
        }
        # calculate total cubes shown in a round
        $round.total = $round.red + $round.green + $round.blue
        if ($round.total -gt $tmax) {
            $invalid = 1
        }
    }

    # checks whether a game (line) has been marked as invalid, if it hasn't add that game's ID to a running total
    switch ($invalid) {
        0 {
            $gameID = $lineText[0] -replace '[a-zA-Z]',''
            [int] $answer += $gameID
            [int] $power = $rMax*$gMax*$bMax
            [int] $answer2 += $power
            break
        }
        1 {
            break
        }
    }

}
$answer2