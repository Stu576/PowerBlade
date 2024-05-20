function Get-ScriptProcesses
{
 
 Clear-host
$continue1 = $false

Write-Host "Loading Processes Module" -ForegroundColor Black -BackgroundColor White
Start-Sleep -Seconds 1

for ($i = 1; $i -le 100; $i++ ) {
    Write-Progress -Activity "Loading Processes Module" -Status "$i% Complete:" -PercentComplete $i
    Start-Sleep -Milliseconds 1
}



do
{
Write-Host "Please Select an Option Below" -ForegroundColor Black -BackgroundColor White
Write-Host "1. View all Processes"
Write-Host "2. Search Process by name"
Write-Host "3. Start New Process"
Write-Host "4. Stop Process"
Write-Host "5. Back to Main Menu"
$procotp = Read-Host "Select an Option"

Switch($procotp){


1{
Write-Host "Option is broken, fixed in future updated"
Write-Output "Press Enter to continue..."
Read-Host
Start-Sleep -Seconds 0.6  
}



2{Clear-Host
Write-Host "Option is broken, fixed in future updated"
Write-Output "Press Enter to continue..."
Read-Host
Start-Sleep -Seconds 0.6                     }

3{Clear-Host
Write-Host "Option is broken, fixed in future updated"
Write-Output "Press Enter to continue..."
Read-Host
Start-Sleep -Seconds 0.6                     }

4{Clear-Host
Write-Host "Option is broken, fixed in future updated"
Write-Output "Press Enter to continue..."
Read-Host
Start-Sleep -Seconds 0.6                     }


5{Clear-Host
"Returning to Main Menu" 
Start-Sleep -Seconds 2
    $continue1 = $true}

} #Switch
}
while ($continue1 -eq $false)
}