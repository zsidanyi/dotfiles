# Created with Windows PowerShell ISE (Integrated Scripting Env)

# My first comment
# cmdlet verb-noun
Write-Host "Hello World!!" -NoNewline
Write-Host "Hello again"

Write-Host "Writing to file"
"May the force be with you" | Out-File forcewithwho.txt

$first_var = 1
Write-Host "The value of my first var is: $firs_var"

# Creating/Copying/Renaming folders and files
New-Item -Path .\ -Name "deathstar" -ItemType Directory
New-Item -Path .\deathstar -Name "vader.txt" -ItemType File
Test-Path .\deathstar\vader.txt

New-Item -Path .\ -Name "sidius.txt" -ItemType File
Copy-Item .\sidius.txt -Destination .\deathstar\
Remove-Item .\sidius.txt
Test-Path .\sidius.txt

New-Item -Path .\ -Name "luke.txt" -ItemType File
Move-Item -Path .\luke.txt -Destination .\deathstar\

Rename-Item -Path .\deathstar\vader.txt -NewName anakin.txt

# Variables
Write-Host "Setting variable"
Write-Host '$FavCharacter = "SpongeBob"'
$FavCharacter = "SpongeBob"
$FavCharacter.GetType()
$FavCharacter | Out-File favcharacter.txt

Write-Host '$FavCharacter = 5'
$FavCharacter = 5
$FavCharacter.GetType()
Write-Host '$FavCharacter = 5.5'
$FavCharacter = 5.5
$FavCharacter.GetType()
Write-Host '$FavCharacter = $true'
$FavCharacter = $true
$FavCharacter.GetType()

# Get all properties of an object
Write-Host '$FavCharacter = "SpongeBob"'
$FavCharacter = "SpongeBob"
$FavCharacter | Select-Object -Property *

# Get all methods invokable on the object
Get-Member -InputObject $FavCharacter

# Arrays - 
$Jedi = @('Obi-Wan Kenobi', 'Luke Skywalker', 'Yoda', 'Mace Windu')
$Jedi # Printing content
$Jedi.GetType()
$Jedi[0]
$Jedi[1]
$Jedi[1].Length # Strings inside array
$Jedi += "Qui-Gon Jin"
$Jedi[-1] # Wrapping; gets last element

# Hashtable
$Fellowship = @{"Wizard" = "Gandalf"; "Hobbit" = "Frodo"; "Elf" = "Legolas"}
$Fellowship
$Fellowship.Add("Dwarf", "Gimli")
$Fellowship
$Fellowship.Set_Item("Hobbit", "Sam")
$Fellowship
$Fellowship["Hobbit"]
$Fellowship."Hobbit" # Same as before
$Fellowship.Remove("Dwarf")
$Fellowship

# Read input from user
$FavSystem = Read-Host -Prompt "What is your favorite Nintendo gaming system? (1. NES, 2, SNES)"
$FavSystem

# if statement
if ($FavSystem -eq 1) {
    Write-Host "Good old NES"
} elseif ($FavSystem -eq 2) {
    Write-Host "Yeah SNES"
} else {
    Write-Host "Not good input"
}

# switch statement
switch ($FavSystem) {
    1 {Write-Host "Good old NES"; break}
    2 {Write-Host "Yeah SNES"; break}
    default {Write-Host "Not good input";}
}

# Loops
$HaloPeeps = @('Master Chief', 'Cortana', 'Captain Keys', 'Flood')

for($counter = 0; $counter -le ($HaloPeeps.Length - 1); $counter++) {
    Write-Host "Holy smokes, its" $HaloPeeps[$counter]
}

foreach($peep in $HaloPeeps) {
    Write-Host "$peep arrived!"
}

$counter = 0
While($counter -ne $HaloPeeps.Length) {
    Write-Host "BAD: $HaloPeeps[$counter] again!" # Not working the way you would think!!! Prints whole array!
    Write-Host $HaloPeeps[$counter] "again!" # Outside of string it works!
    $counter++
}

# Functions
function Test-Me {
    param(
        $PingCount
    )
    #ping -c 4 127.0.0.1
    Test-Connection 127.0.0.1 -Count $PingCount
}
Test-Me -PingCount 1
Test-Me # Error no parameter given but Test-Connection -Count would need it

function Test-Me-Binding {
    [CmdletBinding()] # Turns into adv. function; PS will know that this paramter is needed
    param(
        [Parameter(Mandatory)]
        [int32]$PingCount
    )
    #ping -c 4 127.0.0.1
    Test-Connection 127.0.0.1 -Count $PingCount
}
Test-Me-Binding

# Error handling
function Bad-Function {
    throw "Its a trap!"
    # Write-Error -Message "Its a trap!"# -ErrorAction Stop
}
try { Bad-Function -ErrorAction Stop } catch { Write-Output "It was a trap indeed!" $_ } # $_ return value of function call
