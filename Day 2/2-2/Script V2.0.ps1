<# Function that splits an input string into an array of strings based on a given delimiter,
only if an input is given #>
function Split-String {
    param (
        [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
        $In
        ,
        [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
        [string]$Divider
    )
    
    if ($In) {
        $Out = $In.Split($Divider)
        return $Out
    }
}

<# Sets color limits from part 1 #>
$rLim = 12
$gLim = 13
$bLim = 14

<# Extracts file contents as text #>
$file = "Input.txt"
$games = Get-Content $file

<# Initialize variables #>
[int] $answer = 0

<# Iterates through each line in the text extracted from the given file#>
foreach ($line in $games) {
    <# Initialize power for each game #>
    $power = 0
    
    <# Splits the current line at :, then the text after : at ;, and then
    that array at each , #>
    $Game = Split-String $line ':'
    $Rounds = Split-String $Game[1] ';'
    $Pulls = Split-String $Rounds ','
    
    <# Initialize maximums for each color #>
    [int] $rmax = 0
    [int] $gmax = 0
    [int] $bmax = 0
    
    <# Iterates through each pull of a game (formatted as "'number 'color'") #>
    foreach ($pull in $Pulls) {
        
        <# The pull's color is defined as the second word in the pull and number
        as the first #>
        [string] $color = $pull.Split(' ')[1]
        [int] $count = $pull.Split(' ')[0]
        
        <# The color is then used to determine the maximum number of a cubes of a 
        given color required to play that game #>
        switch ($color) {
            red {
                if ($count -gt $rmax) {
                    $rmax = $count
                }
            }
            green {
                if ($count -gt $gmax) {
                    $gmax = $count
                }
            }
            blue {
                if ($count -gt $bmax) {
                    $bmax = $count
                }
            }
        }
    
    }
    
    <# Checks the maximum number of cubes from each color needed to play a game,
    then checks if that number is considered a valid game by the limits of part 1. 
    If so, its power is determined by multiplying the maximum number required of 
    each color's cubes to play that game and adds it to the answer #>
    if ($rmax -ile $rLim -and $gmax -ile $gLim -and $bmax -ile $bLim) {
        $power = $rmax * $gmax * $bmax
        $answer += $power
    }
}

<# Outputs the answer #>
$answer