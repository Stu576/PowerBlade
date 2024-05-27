
Power-Hyper-V


function Power-Hyper-V{

    $Hypervstatus = Get-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-All
    $LinuxMintURL = "https://mirrors.ukfast.co.uk/sites/linuxmint.com/isos/stable/21.3/linuxmint-21.3-cinnamon-64bit.iso"
    $LinuxKaliURL = "https://cdimage.kali.org/kali-2024.1/kali-linux-2024.1-live-amd64.iso"
    $LinuxPOPOSURL = "https://iso.pop-os.org/22.04/amd64/intel/41/pop-os_22.04_amd64_intel_41.iso"


    #Perform checks here

    #Get request
    $continue1 =$false
    do
    {
        Clear-Host
        Write-Host "Please Select an Option Below" -ForegroundColor Black -BackgroundColor White
        Write-Host "1. Install Hyper-V"
        Write-Host "2. Create Custom VM"
        Write-Host "3. Create Windows 10 VM"
        Write-Host "4. Create Windows 11 VM"
        Write-Host "5. Create Linux VM"
        Write-Host "6. Enable Nested Virtualisation"
        Write-Host "7. Back to Main Menu"
        $procotp = Read-Host "Select an Option"

        Switch($procotp){


            1{
                Clear-Host

                Write-Host "Starting Hyper-V installation"
                Start-Sleep -Seconds 3
                Write-Host "A restart will be required, ensure all work is saved before continuing"
                Read-Host "Press Enter to continue"
                Hyper-V-InstallCheck
                Hyper-V-SpecCheck

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
            Write-Host "Nested Virtusalisation is a Hyper-V feature that allows for the CPU's virtualisation capabilities"
            Write-Host "to be pass through to a virtual machine. This means you can run Hyper-V within a VM."
            Write-Host "`nEnter the name of the Virtual Machine you want to enable nested virtualisation for."
            Read-Host "Press Enter to Continue"
            Hyper-V-NVHost}

            7{Clear-Host
            "Returning to Main Menu"
            Start-Sleep -Seconds 2
            $continue1 = $true }


        } #Switch
    }
    while ($continue1 -eq $false)
}




function Hyper-V-SpecCheck{

}
Function Hyper-V-InstallCheck{

    $Hypervstatus = Get-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-All

    clear-host
    if($Hypervstatus.State -eq $false){Write-Host "Hyper-V's status is" $Hypervstatus.State -ForegroundColor Green}
    else{Write-Host "Hyper-V's status is" $Hypervstatus.State -ForegroundColor Red}



    Write-Host "Starting Requirement Checks.."

}
Function Hyper-V-NVHost{
    Clear-Host

    do{

        $NVVM = Read-Host "Enter the name of the virtual machine you want to enable Nested Virtualisation for? Type 'Exit' to quit"

        $VMlist = Get-VM
        $matchingvm = $VMList | Where-Object { $_.Name -eq $NVVM}


        if($matchingVM){Write- Host "Enabling Nested Virtualisation"
        Set-VMProcessor -ExposeVirtualizationExtensions -VMName $matchingVM
        Start-Sleep -Seconds 3
        Write-Host "Nested Virtualisation has been enabled."
        $vmnamecondition = $True }

        elseif($NVVM -eq "Exit"){
        $vmnamecondition = $True}
    }while ($vmnamecondition -eq $false)
}