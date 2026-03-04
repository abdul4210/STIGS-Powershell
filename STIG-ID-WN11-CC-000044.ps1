<#
.SYNOPSIS
    This PowerShell script disables internet connection sharing.

.NOTES
    Author          : Abdul Ali
    LinkedIn        : linkedin.com/in/abdul4210
    GitHub          : github.com/abdul4210
    Date Created    : 2026-03-03
    Last Modified   : 2026-03-03
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000044

.TESTED ON
    Date(s) Tested  : 2026-03-03
    Tested By       : Abdul Ali
    Systems Tested  : Windows 11 pro
    PowerShell Ver. : 5.1

.USAGE
Run as administrator
#>

# Disable Internet Connection Sharing (ICS)

$RegistryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Network Connections"
$ValueName = "NC_ShowSharedAccessUI"
$DesiredValue = 0


# Create registry path if it does not exist
if (-not (Test-Path $RegistryPath)) {
    New-Item -Path $RegistryPath -Force | Out-Null
}

# Create or update required DWORD value
New-ItemProperty -Path $RegistryPath `
                 -Name $ValueName `
                 -Value $DesiredValue `
                 -PropertyType DWORD `
                 -Force | Out-Null
