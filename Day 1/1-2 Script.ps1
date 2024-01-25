# Define a hashtable to map words (keys) to their numeric equivalents
$wordToNumber = @{
    "one" = "o1e"
    "two" = "t2o"
    "three" = "t3e"
    "four" = "f4r"
    "five" = "f5e"
    "six" = "s6x"
    "seven" = "s7n"
    "eight" = "e8t"
    "nine" = "n9e"
}

# Function to convert text to numbers
function ConvertTextToNumbers {
    param (
        [string]$inputString
    )

    # Loop through the words in the input string
    foreach ($key in $wordToNumber.Keys) {
        # If a match is found, replace with numbers
        $inputString = $inputString -replace $key, $wordToNumber[$key]
    }

    # Output the converted numbers
    return $inputString
}

# Path to the text file
$file = "C:\Users\cwg24\OneDrive\Desktop\Coding\Advent of Code 2023\Day 1\input.txt"

# Read the file content as an array of lines
$dataSet = Get-Content -Path $file
$total = 0

foreach ($line in $dataSet) {
    $lineText = ""
    # Convert text to numbers
    $lineText = ConvertTextToNumbers -inputString $line
    #Remove all non-number characters
    $numbers = $lineText -replace '\D'
    #take the first and last character of the string of numbers
    $firstChar = $numbers[0]
    $lastChar = $numbers[-1]
    #Add the number created by combining previous characters to running total
    $total += "$firstChar$lastChar"

}


Write-Output $total