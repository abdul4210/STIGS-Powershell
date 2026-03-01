<#
.SYNOPSIS
    This PowerShell script disables printing over HTTP.

.NOTES
    Author          : Abdul Ali
    LinkedIn        : linkedin.com/in/abdul4210
    GitHub          : github.com/abdul4210
    Date Created    : 2026-02-26
    Last Modified   : 2026-02-26
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000110

.TESTED ON
    Date(s) Tested  : 2026-02-26
    Tested By       : Abdul Ali
    Systems Tested  : Windows 11 pro
    PowerShell Ver. : 

.USAGE
Run as administrator
#>

# Prevent Printing Over HTTP

$RegistryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Printers"
$ValueName = "DisableHTTPPrinting"
$DesiredValue = 1

# Ensure the registry path exists
if (-not (Test-Path $RegistryPath)) {
    New-Item -Path $RegistryPath -Force | Out-Null
}

# Set the required value
New-ItemProperty -Path $RegistryPath `
                 -Name $ValueName `
                 -Value $DesiredValue `
                 -PropertyType DWORD `
                 -Force | Out-Null
