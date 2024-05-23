
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
            "Returning to Main Menu"
            Start-Sleep -Seconds 2
            $continue1 = $true }


        } #Switch
    }
    while ($continue1 -eq $false)
}




function Hyper-V-SpecCheck{
    $virtulisationcheck = Get-ComputerInfo -property "HyperV*"
    if($virtulisationcheck.HyperVRequirementDataExecutionPreventionAvailable -eq $True){Write-Host "Hyper-V Requirement Data Execution Prevention Available =" $virtulisationcheck.HyperVRequirementDataExecutionPreventionAvailable -Foregroundcolor Green}
    else{Write-Host "Hyper-V Requirement Data Execution Prevention Available = " $virtulisationcheck.HyperVRequirementDataExecutionPreventionAvailable -Foregroundcolor Red}

    if($virtulisationcheck.HyperVRequirementSecondLevelAddressTranslation -eq $True){Write-Host "Hyper-V Requirement Second Level Address Translation =" $virtulisationcheck.HyperVRequirementSecondLevelAddressTranslation -Foregroundcolor Green}
    else{Write-Host "Hyper-V Requirement Second Level Address Translation = " $virtulisationcheck.HyperVRequirementSecondLevelAddressTranslation -Foregroundcolor Red}
    $virtulisationcheck = Get-ComputerInfo -property "HyperV*"
    if($virtulisationcheck.HyperVRequirementVirtualizationFirmwareEnabled -eq $True){Write-Host "Hyper-V Requirement Virtualization Firmware Enabled =" $virtulisationcheck.HyperVRequirementVirtualizationFirmwareEnabled -Foregroundcolor Green}
    else{Write-Host "Hyper-V Requirement Virtualization Firmware Enabled = " $virtulisationcheck.HyperVRequirementVirtualizationFirmwareEnabled -Foregroundcolor Red}

    if($virtulisationcheck.HyperVRequirementVMMonitorModeExtensions -eq $True){Write-Host "Hyper-V Requirement VM Monitor Mode Extensions =" $virtulisationcheck.HyperVRequirementVMMonitorModeExtensions -Foregroundcolor Green}
    else{Write-Host "Hyper-V Requirement VM Monitor Mode Extensions = " $virtulisationcheck.HyperVRequirementVMMonitorModeExtensions -Foregroundcolor Red}

    if($virtulisationcheck.HyperVRequirementDataExecutionPreventionAvailable -eq $True -and
            $virtulisationcheck.HyperVRequirementSecondLevelAddressTranslation -eq $True -and
            $virtulisationcheck.HyperVRequirementVirtualizationFirmwareEnabled -eq $True -and
            $virtulisationcheck.HyperVRequirementVMMonitorModeExtensions -eq $True){

        Read-Host "Press Enter to begin installation"}
    else{
        Write-Warning "Minimum Requirements have not been met, please review the above and resolve before trying again"
        Read-Host "Press enter to return to menu"

    }



}

