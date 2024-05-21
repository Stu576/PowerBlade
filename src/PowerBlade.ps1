function Test-IsAdmin{
  $currentUser = [Security.Principal.WindowsIdentity]::GetCurrent()
  $currentPrincipal = New-Object Security.Principal.WindowsPrincipal($currentUser)
  return $currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator) }

function Install-Pservice
{
  $extractPath = "C:\temp\"
  $fileUrl1 = "https://github.com/Stu576/PowerBlade/releases/download/0.02/Power-Services.zip"
  $zipFilePath1 = "C:\temp\Power-Services.zip"
  if (-not (Test-Path -Path $extractPath)) {
    New-Item -Path $extractPath -ItemType Directory -Force
    Clear-Host
  }
  Write-Host "Downloading Power Services"
  Start-Sleep -Seconds 1
  Invoke-WebRequest -Uri $fileUrl1 -OutFile $zipFilePath1
  Write-Host "Extracting Power Services"
  Start-Sleep -Seconds 3
  Add-Type -AssemblyName System.IO.Compression.FileSystem
  [System.IO.Compression.ZipFile]::ExtractToDirectory($zipFilePath1, $extractPath)


}

function Install-Pprocess
{
  $extractPath = "C:\temp\"

  $fileUrl2 = "https://github.com/Stu576/PowerBlade/releases/download/0.02/Power-Process.zip"
  $zipFilePath2 = "C:\temp\Power-Process.zip"
  if (-not (Test-Path -Path $extractPath)) {
    New-Item -Path $extractPath -ItemType Directory -Force
  }
  Write-Host "Downloading Power Process"
  Start-Sleep -Seconds 1
  Invoke-WebRequest -Uri $fileUrl2 -OutFile $zipFilePath2
  Write-Host "Extracting Power Process"
  Start-Sleep -Seconds 3
  Add-Type -AssemblyName System.IO.Compression.FileSystem
  [System.IO.Compression.ZipFile]::ExtractToDirectory($zipFilePath2, $extractPath)



}
function Install-PBin
{
  $extractPath = "C:\temp\"

  $fileUrl3 = "https://github.com/Stu576/PowerBlade/releases/download/0.02/Power-Bin.zip"
  $zipFilePath3 = "C:\temp\Power-Bin.zip"
  if (-not (Test-Path -Path $extractPath)) {
    New-Item -Path $extractPath -ItemType Directory -Force
    clear-host
  }
  Write-Host "Downloading Power Bin"
  Start-Sleep -Seconds 1
  Invoke-WebRequest -Uri $fileUrl3 -OutFile $zipFilePath3
  Write-Host "Extracting Power Bin"
  Start-Sleep -Seconds 3
  Add-Type -AssemblyName System.IO.Compression.FileSystem
  [System.IO.Compression.ZipFile]::ExtractToDirectory($zipFilePath3, $extractPath)

}

function Copy-module {
  $sourcePath = "C:\temp"
  $destinationPath = "C:\Program Files\WindowsPowerShell\Modules"
  $directories = Get-ChildItem -Path $sourcePath -Directory

  foreach ($dir in $directories) {
    $sourceDir = $dir.FullName
    $destDir = Join-Path -Path $destinationPath -ChildPath $dir.Name
    Copy-Item -Path $sourceDir -Destination $destDir -Recurse
  }
  Start-Sleep -Seconds 5
  Remove-Item $sourcePath -Recurse

}
function Delete-Modules {
  Write-Host "Test"
  Remove-Item -Path $pathfolder1 -Recurse -Force
  Remove-Item -Path $pathfolder2 -Recurse -Force
  Remove-Item -Path $pathfolder3 -Recurse -Force
  Write-Host "All modules have been deleted"
  Start-Sleep -Seconds 3
}


$pathfile1 = "C:\Program Files\WindowsPowerShell\Modules\Power-Services\Power-Services.psm1"
$pathfile2 = "C:\Program Files\WindowsPowerShell\Modules\Power-Process\Power-Process.psm1"
$pathfile3 = "C:\Program Files\WindowsPowerShell\Modules\Power-Bin\Power-Bin.psm1"
$pathfolder1 = "C:\Program Files\WindowsPowerShell\Modules\Power-Services\"
$pathfolder2 = "C:\Program Files\WindowsPowerShell\Modules\Power-Process\"
$pathfolder3 = "C:\Program Files\WindowsPowerShell\Modules\Power-Bin\"
$pathfile1Result = Test-Path $pathfile1
$pathfile2Result = Test-Path $pathfile2
$pathfile3Result = Test-Path $pathfile3
$ExPolicy = Get-ExecutionPolicy

Clear-host
$continue = $false
$moduleVer = 0.02
$modulephase = "Alpha"
$asciiArt = @"
__________                         __________.__              .___      
\______   \______  _  __ __________\______   \  | _____     __| _/____  
 |     ___/  _ \ \/ \/ // __ \_  __ \    |  _/  | \__  \   / __ |/ __ \ 
 |    |  (  <_> )     /\  ___/|  | \/    |   \  |__/ __ \_/ /_/ \  ___/ 
 |____|   \____/ \/\_/  \___  >__|  |______  /____(____  /\____ |\___  >
                            \/             \/          \/      \/    \/ 

                             By Stuart Moore V$moduleVer-$modulephase
"@

Write-Host $asciiArt -ForegroundColor Cyan

Write-Host "Performing Module Check..."
Write-Host "V$moduleVer-$modulephase"
  if ($ExPolicy -ne "Unrestricted")
  {
    Write-Warning "Execution Policy is restrictive, it is recommended to be set to 'Unrestricted'. Module installation may fail."
  }


  if ($pathfile1Result -eq $true)
  {
    Write-Host "Services Module exists..." -ForegroundColor Green
  }
  else
  {
    Write-Host "Services Module not installed" -ForegroundColor Red
  }
  if ($pathfile2Result -eq $true)
  {
    Write-Host "Processes Module exists..." -ForegroundColor Green
  }
  else
  {
    Write-Host "Processes Module not installed" -ForegroundColor Red
  }
  if ($pathfile3Result -eq $true)
  {
    Write-Host "Bin Module exists..." -ForegroundColor Green
  }
  else
  {
    Write-Host "Bin Module not installed" -ForegroundColor Red
  }



  if (-not $pathfile1Result -or -not $pathfile2Result -or -not $pathfile3Result)
  {

    if (-not (Test-IsAdmin))
    {
      Write-Warning "CLOSE A RERUN AS ADMINISTRATOR, MODULE INSTALL WILL FAIL REGARDLESS"
      Write-Host "`nPress Enter to quit" -ForegroundColor White
      Read-Host
      exit 1
    }

    Write-Output "`nPress Enter to install required modules"
    Read-Host

    if ($pathfile1Result -eq $false)
    {
      Install-Pservice

    }
    if ($pathfile2Result -eq $false)
    {
      Install-PProcess

    }
    if ($pathfile3Result -eq $false)
    {
      Install-PBin

    }
    Copy-module

    Write-Host "All modules have been successfully installed" -ForegroundColor Green
    Write-Host "You must restart the terminal window before continuing" -ForegroundColor Green
    Write-Host "You do not need to run as admin going forward" -ForegroundColor Green

    Write-Host "`nPress Enter to quit" -ForegroundColor White
    Read-Host
    Write-Host "`nQuitting" -ForegroundColor White
    exit


  }##IF
  else
  {
    Write-Host "All Modules are installed" -ForegroundColor Green
  }


  Write-Host "All checks successful"
  Start-Sleep -Seconds 0.6
Clear-Host

do
{
  Clear-Host
  Write-Host $asciiArt -ForegroundColor Cyan
Write-Host "`nPlease Select an Option Below" -ForegroundColor Black -BackgroundColor White
Write-Host "1. Display all services"
Write-Host "2. Display all processes"
Write-Host "3. Recycling Bin Manager"
Write-Host "4. Install Applications"
Write-Host "9. Reinstall Modules (Run as Admin)"
Write-Host "10. Exit"
$usroptn = Read-Host "Select Option"


Switch ($usroptn)
{
1{
  Power-Services}
2{
  Power-Process}
3{
  for ($i = 1; $i -le 100; $i++ ) {
    Write-Progress -Activity "Loading recycling bin module" -Status "$i% Complete:" -PercentComplete $i
    Start-Sleep -Milliseconds 1}
Power-Bin}
4{Write-Host "Option 4 - WIP - Next Update" -ForegroundColor Red
}
9{
  Delete-Modules
  Install-Pservice
  Install-Pprocess
  Install-PBin
  Copy-Module
Write-Host "Install Completed, Restart Terminal for updates to take effect."
  Read-Host

}
10{Write-Host "Are you sure you want to quit"
$areusure = Read-Host "(y=Yes/n=No)"
if($areusure -eq "y")
{
  $continue = $true
}

}

default {
  "Option is not recognised, select a valid number"}
}


}
while ($continue -eq $false)
