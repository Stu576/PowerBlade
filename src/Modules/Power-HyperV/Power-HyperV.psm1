functon Power-Hyper-V{

$Hypervstatus = Get-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-All


do
    {

        Write-Host "Please Select an Option Below" -ForegroundColor Black -BackgroundColor White
        Write-Host "1. Install Hyper-V"
        Write-Host "2. Create Custom VM"
        Write-Host "3. Create Windows 10 VM"
        Write-Host "4. Create Windows 11 VM"
        Write-Host "5. Create Linux VM"
        Write-Host "6. Back to Main Menu"
        $procotp = Read-Host "Select an Option"

        Switch($procotp){


            1{
                Clear-Host

If($Hypervstatus.Status -eq "Enabled")
{
Write-Warning "Hyper-V is installed"
Read-Host "Press Enter to return to menu"
}
else{Write-Host "Hyper-V is not installed" -Foregroundcolor Green

Write-Host "Starting Hyper-V installation"
Start-Sleep -Seconds 3
Write-Host "A restart will be required, ensure all work is saved before continuing"
Read-Host "Press Enter to continue"

Install-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-All

}


            }



            2{Clear-Host
            Clear-Host
            Write-Host "Create Custom VM"
            Read-Host
            }

            3{Clear-Host
            Write-Host "Create Windows 10 VM"
            Read-Host                  }

            4{Clear-Host
            Write-Host "Create Windows 11 VM"
            Read-Host                   }


            5{Clear-Host
            Write-Host "Create Linux VM"
            Read-Host  }

            6{Clear-Host
            "Returning to Main Menu"
            Start-Sleep -Seconds 2
            $continue1 = $true }


        } #Switch
    }
    while ($continue1 -eq $false)
}