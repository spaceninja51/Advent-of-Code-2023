function Split-Line {
    
    param (
        [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
        [string[]]$In ,
    
    
        [Parameter(Mandatory=$true, ValueFromPipeline=$false)]
        [string[]]$Divider
    )
    
    $Out + $In.Split($Divider)

    return $Out
}

$file = "Input.txt"
$games = Get-Content $file

foreach ($game in $games) {
    Split-Line $game :
}