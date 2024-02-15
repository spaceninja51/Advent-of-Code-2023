$text = Get-Content "Day 3\test.txt"

$lineNo = 0
$numPos, $symPos = @()

foreach ($line in $text) {
    
    <# Tracks the line number #>
    $lineNo++
    
    <# Checks the lines before and after the current, and if blank sets its variable
    to a line with no numbers or symbols. Otherwise the next and previous lines are 
    set respectively #>
    if ($null -eq $text[$lineNo + 1]) {
        $nextLine = "."*($line.Length)
    }
    elseif ($null -eq $text[$lineNo - 1]) {
        $prevLine = "."*($line.Length)
    }
    else {
        $nextLine = $text[$lineNo + 1]
        $prevLine = $text[$lineNo - 1]
    }

}