$pathfile1 = "C:\Program Files\WindowsPowerShell\Modules\Get-ColourServices\Get-ColourServices.psm1"
$pathfile2 = "C:\Program Files\WindowsPowerShell\Modules\Get-ScriptProcesses\Get-ScriptProcesses.psm1"
$pathfile3 = "C:\Program Files\WindowsPowerShell\Modules\take-binout\take-binout.psm1"
$pathfolder1 = "C:\Program Files\WindowsPowerShell\Modules\Get-ColourServices\"
$pathfolder2 = "C:\Program Files\WindowsPowerShell\Modules\Get-ScriptProcesses\"
$pathfolder3 = "C:\Program Files\WindowsPowerShell\Modules\take-binout\"
$githubpath1 = "https://github.com/Stu576/PowerBlade/releases/download/0.01/Get-ColourServices.zip"
$githubpath2 = "https://github.com/Stu576/PowerBlade/releases/download/0.01/Get-ScriptProcesses.zip"
$githubpath3 = "https://github.com/Stu576/PowerBlade/releases/download/0.01/take-binout.zip"
$pathfile1Result = Test-Path $pathfile1
$pathfile2Result = Test-Path $pathfile2
$pathfile3Result = Test-Path $pathfile3
$ExPolicy = Get-ExecutionPolicy

Clear-host
$continue = $false
$moduleVer = 0.01

$asciiArt = @"
__________                         __________.__              .___      
\______   \______  _  __ __________\______   \  | _____     __| _/____  
 |     ___/  _ \ \/ \/ // __ \_  __ \    |  _/  | \__  \   / __ |/ __ \ 
 |    |  (  <_> )     /\  ___/|  | \/    |   \  |__/ __ \_/ /_/ \  ___/ 
 |____|   \____/ \/\_/  \___  >__|  |______  /____(____  /\____ |\___  >
                            \/             \/          \/      \/    \/ 

                             By Stuart Moore V0.01-Alpha
"@

Write-Host $asciiArt -ForegroundColor Cyan

Write-Host "Performing Module Check..."

if ($ExPolicy -ne "Unrestricted") {Write-Warning "Execution Policy is restrictive, it is recommended to be set to 'Unrestricted'. Module installation may fail."}


if ($pathfile1Result -eq $true) {
  Write-Host "Services Module exists..." -ForegroundColor Green
} else {
  Write-Host "Services Module not installed" -ForegroundColor Red
}
if ($pathfile2Result -eq $true) {
  Write-Host "Processes Module exists..." -ForegroundColor Green
} else {
  Write-Host "Processes Module not installed" -ForegroundColor Red
}
if ($pathfile3Result -eq $true) {
  Write-Host "Bin Module exists..." -ForegroundColor Green
} else {
  Write-Host "Bin Module not installed" -ForegroundColor Red
}

if (-not $pathfile1Result -or -not $pathfile2Result -or -not $pathfile3Result) {
  Write-Output "`nPress Enter to install required modules"
  Read-Host

if ($pathfile1Result -eq $false){Import-Module -Name $githubpath1}
if ($pathfile2Result -eq $false){Import-Module -Name $githubpath2}
if ($pathfile3Result -eq $false){Import-Module -Name $githubpath3}
}
else
{
  Write-Host "`nAll Modules are installed" -ForegroundColor Green
}




Write-Host "All checks successful"
Start-Sleep -Seconds 0.6

Clear-Host

do
{
Write-Host $asciiArt -ForegroundColor Cyan
Write-Host "Please Select an Option Below" -ForegroundColor Black -BackgroundColor White
Write-Host "1. Display all services"
Write-Host "2. Display all processes"
Write-Host "3. Recycling Bin Manager"
Write-Host "4. Install Applications"
Write-Host "5. Exit"
$usroptn = Read-Host "Select Option"


Switch ($usroptn)
{
1{



  Get-ColourServices}
2{


  Get-ScriptProcesses}
3{
  for ($i = 1; $i -le 100; $i++ ) {
    Write-Progress -Activity "Loading recycling bin module" -Status "$i% Complete:" -PercentComplete $i
    Start-Sleep -Milliseconds 1
  }

  take-binout}
4{Write-Host "Option 4 - WIP - Next Update" -ForegroundColor Red}
5{Write-Host "Are you sure you want to quit" 
  $areusure = Read-Host "(y=Yes/n=No)"  
  if($areusure -eq "y")
  {
  $continue = $true
  
  }
 
                          }
}


}
while ($continue -eq $false)
