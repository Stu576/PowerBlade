function take-binout
{
 
 Clear-host
$continue1 = $false

Write-Host "Loading recycling bin module" -ForegroundColor Black -BackgroundColor White
Start-Sleep -Seconds 1

for ($i = 1; $i -le 100; $i++ ) {
    Write-Progress -Activity "Loading recycling bin module" -Status "$i% Complete:" -PercentComplete $i
    Start-Sleep -Milliseconds 1
}



do
{
Write-Host "Please Select an Option Below" -ForegroundColor Black -BackgroundColor White
Write-Host "1. Recycle Bin Status"
Write-Host "2. Clear Recycle Bin"
Write-Host "3. Back to Main Menu"
$bin = Read-Host "Select an Option"

Switch($bin){


1{
Write-Host "Option is broken, fixed in future updated"
Write-Output "Press Enter to continue..."
Read-Host
Start-Sleep -Seconds 0.6  
}



2{Clear-Host
Clear-RecycleBin -Force
Write-Host "Recycling Bin has been emptied"
Write-Output "Press Enter to continue..."
Read-Host
Start-Sleep -Seconds 0.6                    }




3{Clear-Host
"Option 7 selected" 
    $continue1 = $true}

} #Switch
}
while ($continue1 -eq $false)
}