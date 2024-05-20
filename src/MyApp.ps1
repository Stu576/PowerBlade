




Clear-host
$continue = $false

$asciiArt = @"
__________                         __________.__              .___      
\______   \______  _  __ __________\______   \  | _____     __| _/____  
 |     ___/  _ \ \/ \/ // __ \_  __ \    |  _/  | \__  \   / __ |/ __ \ 
 |    |  (  <_> )     /\  ___/|  | \/    |   \  |__/ __ \_/ /_/ \  ___/ 
 |____|   \____/ \/\_/  \___  >__|  |______  /____(____  /\____ |\___  >
                            \/             \/          \/      \/    \/ 

                             By Stuart Moore
"@

Write-Host $asciiArt -ForegroundColor Cyan

Write-Host "Performing Module Check..."

$path1 = "C:\Program Files\WindowsPowerShell\Modules\Get-ColourServices\Get-ColourServices.psm1"
$path2 = "C:\Program Files\WindowsPowerShell\Modules\Get-ScriptProcesses\Get-ScriptProcesses.psm1"
$path3 = "C:\Program Files\WindowsPowerShell\Modules\take-binout\take-binout.psm1"
$path1Result = $false
$path2Result = $false
$path3Result = $false


if (Test-Path $path1) {
  Write-Host "Services Module exists..." -ForegroundColor Green
  $path1Result = $true
} else {
  Write-Host "Services Module not installed" -ForegroundColor Red
}

if (Test-Path $path2) {
  Write-Host "Processes Module exists..." -ForegroundColor Green
  $path2Result = $true
} else {
  Write-Host "Processes Module not installed" -ForegroundColor Red
}
if (Test-Path $path3) {
  Write-Host "Bin Module exists..." -ForegroundColor Green
  $path3Result = $true
} else {
  Write-Host "Bin Module not installed" -ForegroundColor Red
}




Write-Output "`n Press Enter to continue..."
Read-Host
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
