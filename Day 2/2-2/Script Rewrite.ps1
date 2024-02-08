#initialize variables
$gameID, $answer = 0
# set desired red, green, and blue maximum values
$rmax = 12
$gmax = 13
$bmax = 14

# data to be processed
$text = Get-Content "C:\Users\cwg24\OneDrive\Desktop\Nerd Shit\Scripting\Advent-of-Code-2023\Day 2\Input.txt"

# Iterate through each line of the input text and break the line into the two strings made of the text on either side of :
foreach ($line in $text.Split([Environment]::NewLine, [StringSplitOptions]::RemoveEmptyEntries)) {
    
    $invalid = 0
    $lineText = $line.Split(":")
    
    $rhigh,$ghigh,$bhigh = 0

    foreach($pull in $lineText[1].Split(";")) {

        foreach ($count in $pull.Split(",").Trim()) {
            # check the number to be set
            [int] $countNo = $count.Split(" ")[0].Trim()

            # find the color the number goes to and set it
            $countColor = $count.Split(" ")[1].Trim()
            switch ($countColor) {
                "red" {
                    if ($countNo -gt $rmax) {
                        $invalid = 1
                    }
                    elseif ($countNo -gt $rhigh) {
                        $rhigh = $countNo
                    }
                    break
                }
                "green" {
                    if ($countNo -gt $gmax) {
                        $invalid = 1
                    }
                    elseif ($countNo -gt $ghigh) {
                        $ghigh = $countNo
                    }
                    break
                }
                "blue" {
                    if ($countNo -gt $bmax) {
                        $invalid = 1
                    }
                    elseif ($countNo -gt $bhigh) {
                        $bhigh = $countNo
                    }
                    break
                }
            }
        }
    }

    # checks whether a game (line) has been marked as invalid, if it hasn't add that game's ID to a running total
    switch ($invalid) {
        0 {
            $power = $rhigh*$ghigh*$bhigh
            $answer += $power
            break
        }
        1 {
            break
        }
    }
}
$answer