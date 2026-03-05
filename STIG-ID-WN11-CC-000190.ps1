<#
.SYNOPSIS
    This PowerShell script disables autoplay for all drives

.NOTES
    Author          : Abdul Ali
    LinkedIn        : linkedin.com/in/abdul4210
    GitHub          : github.com/abdul4210
    Date Created    : 2026-03-05
    Last Modified   : 2026-03-05
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000190

.TESTED ON
    Date(s) Tested  : 2026-03-05
    Tested By       : Abdul Ali
    Systems Tested  : Windows 11 pro
    PowerShell Ver. : 5.1

.USAGE
Run as administrator
#>

# Disable AutoPlay on All Drives

$RegistryPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer"
$ValueName = "NoDriveTypeAutoRun"
$DesiredValue = 255


# Ensure registry path exists
if (-not (Test-Path $RegistryPath)) {
    New-Item -Path $RegistryPath -Force | Out-Null
}

# Create or update the registry value
New-ItemProperty -Path $RegistryPath `
                 -Name $ValueName `
                 -Value $DesiredValue `
                 -PropertyType DWORD `
                 -Force | Out-Null
