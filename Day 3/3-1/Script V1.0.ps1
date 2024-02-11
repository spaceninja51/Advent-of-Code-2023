$text = Get-Content "Day 3\test.txt"

foreach ($line in $text) {

    <# Selects the numbers in the current line and stores their positions #>
    $num = $line | Where-Object "[0-9]"
    $numPos = $line.Matches.Index
    
    <# Selects the symbols in the current line and stores their positions #>
    $sym = $line | Select-String -Pattern "\W"
    $symPos = $line.Matches.Index
    
    <# Checks the lines before and after the current, and if blank sets its variable
    to a line with no numbers or symbols. Otherwise the next and previous lines are 
    set respectively #>
    if ($null -eq $text[$_ + 1]) {
        $nextLine = "."*($line.Length)
    }
    elseif ($null -eq $text[$_ - 1]) {
        $prevLine = "."*($line.Length)
    }
    else {
        $nextLine = $text[$_ + 1]
        $prevLine = $text[$_ - 1]
    }

}