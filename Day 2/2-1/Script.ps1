<# $text = "Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green" #>

$text = "Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green"
class Round {
    [int] $red = 0
    [int] $green = 0
    [int] $blue = 0
    [int] $total = 0
}

# Iterate through each line of the input text and break the line into the two strings made of the text on either side of :
foreach ($line in $text.Split([Environment]::NewLine, [StringSplitOptions]::RemoveEmptyEntries)) {

    $gameID = $line.split(":")[0] -replace '[a-zA-Z]',''
    
    foreach($pull in $lineText[1].Split(";")) {
        # create a new round object after each ;
        $round = [Round]::new()
        
        foreach ($count in $pull.Split(",")) {
            $count
            # find each color count in a round and set their values
            switch ($count.Contains((' red')), ($count.Contains(' green')), ($count.Contains(' blue'))) {
                ($count.contains('red')) {
                    $round.red = $count -replace '[a-zA-Z]',''
                    $count = "null"
                    break
                }
                ($count.contains('green')) {
                    $round.green = $count -replace '[a-zA-Z]',''
                    $count = "null"
                    break
                }
                ($count.contains('blue')) {
                    $round.blue = $count -replace '[a-zA-Z]',''
                    $count = "null"
                    break
                }
            }
        }
        # calculate total cubes shown in a round
        $round.total = $round.red + $round.green + $round.blue
    
    }
}