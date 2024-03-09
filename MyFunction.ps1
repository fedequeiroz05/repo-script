#Creating simple function 


function Get-MachineInfo {
    [CmdletBinding()]
    param (
        $make,
        $operatingsystem
    )
    Write-Verbose "Sharing information about my laptop" 
    Write-Host "I have $make Laptops with $operatingsystem OS"
}

(Get-Command -Name Get-MachineInfo).Parameters.Keys 

Get-MachineInfo -Verbose


## adding whatif and confirm parameter

function Get-MachineInfo {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        $make,
        $operatingsystem
    )
    Write-Verbose "Sharing information about my laptop" 
    Write-Host "I have $make Laptops with $operatingsystem OS"
}

(Get-Command -Name Get-MachineInfo).Parameters.Keys

# Declaring Mandatory Parameter

function Get-MachineInfo {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        # Parameter help description
        [Parameter(Mandatory)]
        $make,
        $operatingsystem
    )
    Write-Verbose "Sharing information about my laptop" 
    Write-Host "I have $make Laptops with $operatingsystem OS"
}
Get-MachineInfo
(Get-Command -Name Get-MachineInfo).Parameters.Keys

## ensuring single value against a parameter

function Get-MachineInfo {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        # Parameter help description
        [String[]]$make,
        $operatingsystem
    )
    Write-Verbose "Sharing information about my laptop" 
    Write-Host "I have $make Laptops with $operatingsystem OS"
}

Get-MachineInfo -make "Dell" , "Lenovo"

(Get-Command -Name Get-MachineInfo).Parameters.Keys

# Defining default value of a parameter

function Get-MachineInfo {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        # Parameter help description
        [String[]]$make = "IBM",
        $operatingsystem
    )
    Write-Verbose "Sharing information about my laptop" 
    Write-Host "I have $make Laptops with $operatingsystem OS"
}

Get-MachineInfo -make Dell

(Get-Command -Name Get-MachineInfo).Parameters.Keys

# Writing 

Help Get-MachineInfo -ShowWindow

# Creating menu of possible values of a parameter

function Get-MachineInfo {
    [CmdletBinding(SupportsShouldContinue)]
    param (
        [ValidateSet ("Dell", "IBM" , "Lenovo")]
        [String[]]$make = "IBM",
        $operatingsystem
    )
    Write-Verbose "Sharing information about my laptop" 
    Write-Host "I have $make Laptops with $operatingsystem OS"
}
Get-MachineInfo  -make Lenovo




