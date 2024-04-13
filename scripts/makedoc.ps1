# Use the current directory as the root directory
$rootDirectory = Get-Location

# Define the output Markdown file path
$outputFile = Join-Path $rootDirectory "combined.md"

# Ensure any existing output file is cleared/removed before starting
if (Test-Path $outputFile) {
    Remove-Item $outputFile
}

# Recursively find all .sh files in the directory and subdirectories
Get-ChildItem -Path $rootDirectory -Filter *.sh -Recurse | ForEach-Object {
    # Prepend the filename as a second-level Markdown heading
    $filenameHeader = "## " + $_.Name
    Add-Content -Path $outputFile -Value "$filenameHeader`r`n"
    Add-Content -Path $outputFile -Value "``````sh`r`n"
    Get-Content $_.FullName | Add-Content -Path $outputFile
    Add-Content -Path $outputFile -Value "`r`n``````"
    Add-Content -Path $outputFile -Value "`r`n"
}

# Output a completion message
Write-Host "All .sh files have been combined into $outputFile"
