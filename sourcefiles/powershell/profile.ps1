### Prerequisits

## 1. Set execution policy for current user if needed
# Get-ExecutionPolicy -List
# Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

## 2. Place of profile file:
# echo $profile; C:\Users\$env:username\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
# for extesnions to modify check in fileexplorer->file name extensions

# Use the following to parse again after modification:
# iex $profile

### Beginning of effective file

## Setting Bash like operation for completion
#Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadLineKeyHandler -Key Tab -Function Complete
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

## Aliases
Set-Alias -Name ll -Value Get-ChildItem
Function CDUP {Set-Location ..}
Set-Alias -Name .. -Value CDUP

#Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -name "fDenyTSConnections" -value 0
#Enable-NetFirewallRule -DisplayGroup "Remote Desktop"

#Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -name "fDenyTSConnections" -value 1
#Disable-NetFirewallRule -DisplayGroup "Remote Desktop"

## Updating helps if not done yet
$ModuleHelps2Update = @('Microsoft.Powershell.Core', 'Microsoft.Powershell.Utility', 'Microsoft.PowerShell.Management', 'Microsoft.PowerShell.Security')
Update-Help -Module $ModuleHelps2Update

### End of profile
echo "Custom profile read"
