<# Example data: 
"Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green" 

Game 1-5 powers: 48, 12, 1560, 630, 36
Example answer: 2286
#>

class Round {
    [int] $red
    [int] $green
    [int] $blue
}

class Game {
    [int] $ID
    [int] $bmin
    [int] $gmin
    [int] $rmin
    [int] $Power
    [Array] $Rounds
}

<# initialize variables #>
$answer = 0

<# data to be processed #>
$file = "C:\Scripting\Advent-of-Code-2023\Day 2\Input.txt"
$text = Get-Content $file

<# Looping through each line by converting the text into an array with a new entry at each new line #>
foreach ($line in $text.Split([Environment]::NewLine)) {
    
    <# Gets the games # and creates a new Game object with that # as its ID #>
    $GameID = $line[0] -replace '[a-zA-Z]',''
    $currentGame = New-Object -TypeName Game -Property ID -Value $GameID
    Add-Member -TypeName NoteProperty -Name ID -Value $GameID
    
}