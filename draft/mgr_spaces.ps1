$files = Get-ChildItem

# Iterate through each file
foreach ($file in $files) {
    # Replace spaces with underscores
    $newName = $file.Name -replace ' ', '_'
    
    # Replace parentheses with underscores
    # $newName = $newName -replace '[()]', '_'
    
    # Rename the file
    # Rename-Item -Path $file.FullName -NewName $newName
}
