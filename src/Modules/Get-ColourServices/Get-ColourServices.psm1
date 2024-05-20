function Get-ColourServices {
Clear-host
$continue1 = $false

Write-Host "Loading module to display all services" -ForegroundColor Black -BackgroundColor White
Start-Sleep -Seconds 1

for ($i = 1; $i -le 100; $i++ ) {
    Write-Progress -Activity "Loading Services Module" -Status "$i% Complete:" -PercentComplete $i
    Start-Sleep -Milliseconds 2
}


do
{
Write-Host "Please select which options you want to see"  -ForegroundColor Black -BackgroundColor White
Write-Host "1. Show all running"
Write-Host "2. Show all stopped"
Write-Host "3. Show all"
Write-Host "4. Display Service Details"
Write-Host "5. Start Service"
Write-Host "6. Stop Service"
Write-Host "7. Back to main menu"

$serviceoption = Read-Host "Select an Option"



Switch ($serviceoption){

1 {Clear-Host
    "Option 1 selected" 
    
$services = Get-Service    
Foreach ($service in $services)
{#ForEach
If ($service.status -eq "Running")
{#IF
Write-Host "Service Name: " $service.Name "Status: "$service.Status -ForegroundColor Green | Format-List
}#IF
}#ForEach

Write-Output "Press Enter to continue..."
Read-Host
Start-Sleep -Seconds 0.6


                        }

2 {Clear-Host
"Option 2 selected" 

$services = Get-Service    
Foreach ($service in $services)
{#ForEach
If ($service.status -ne "Running")
{#IF
Write-Host "Service Name: " $service.Name "Status: "$service.Status -ForegroundColor Red | Format-List
}#IF
}#ForEach
Write-Output "Press Enter to continue..."
Read-Host
Start-Sleep -Seconds 0.6
}

3 {Clear-Host
"Option 3 selected" 
$services = Get-Service    
Foreach ($service in $services)
{#ForEach
If ($service.status -eq "Running")
{
Write-Host "Service Name: " $service.Name "Status: "$service.Status -ForegroundColor Green
}
else{
Write-Host "Service Name: " $service.Name "Status: "$service.Status -ForegroundColor Red
}

}#ForEach
Write-Output "Press Enter to continue..."
Read-Host
Start-Sleep -Seconds 0.6


}

4 {Clear-Host
"Option 4 selected"

$usrservice = Read-Host "Enter a service to get details of (Enter Display or service name)"

Get-Service $usrservice
Write-Output "Press Enter to continue..."
Read-Host
Start-Sleep -Seconds 0.6
}

5 {Clear-Host
"Option 5 selected" 

$usrservice = Read-Host "Enter a service to get details of (Enter Display or service name)"

Start-Service $usrservice
Write-Output "Press Enter to continue..."
Read-Host
Start-Sleep -Seconds 0.6
}
6 {Clear-Host
"Option 6 selected" 

$usrservice = Read-Host "Enter a service to get details of (Enter Display or service name)"

Stop-Service $usrservice
Write-Output "Press Enter to continue..."
Read-Host
Start-Sleep -Seconds 0.6
}


7 {Clear-Host
"Option 7 selected" 
    $continue1 = $true

                        }








}#switch

}
while ($continue1 -eq $false)

} #function