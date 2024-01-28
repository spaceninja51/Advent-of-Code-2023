#$text = "Game 1: 1 red, 2 green, 6 blue"
$text = Get-Content "C:\Users\cwg24\OneDrive\Desktop\Nerd Shit\Scripting\Advent of Code 2023\Day 2\2-1\Input.txt"
class Round {
    [int] $red
    [int] $green
    [int] $blue
    [int] $total
}

# Iterate through each line of the input text and break the line into the two strings made of the text on either side of :
foreach ($line in $text.Split([Environment]::NewLine, [StringSplitOptions]::RemoveEmptyEntries)) {

    $lineText = $line.Split(":")
    $gameID = $lineText[0] -replace '[a-zA-Z]',''
    
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
                    break
                }
                "green" {
                    $round.green = $countNo
                    break
                }
                "blue" {
                    $round.blue = $countNo
                    break
                }
            }
        }
        # calculate total cubes shown in a round
        $round.total = $round.red + $round.green + $round.blue
    }
}