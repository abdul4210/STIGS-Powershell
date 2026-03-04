<#
.SYNOPSIS
    This PowerShell script enables Microsoft Defender SmartScreen for Explorer.

.NOTES
    Author          : Abdul Ali
    LinkedIn        : linkedin.com/in/abdul4210
    GitHub          : github.com/abdul4210
    Date Created    : 2026-03-03
    Last Modified   : 2026-03-03
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000210

.TESTED ON
    Date(s) Tested  : 2026-03-03
    Tested By       : Abdul Ali
    Systems Tested  : Windows 11 pro
    PowerShell Ver. : 5.1

.USAGE
Run as administrator
#>

# Enable Microsoft Defender SmartScreen for Explorer

$RegistryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System"


# Ensure registry path exists
if (-not (Test-Path $RegistryPath)) {
    New-Item -Path $RegistryPath -Force | Out-Null
}

# Enable SmartScreen (DWORD)
New-ItemProperty -Path $RegistryPath `
                 -Name "EnableSmartScreen" `
                 -Value 1 `
                 -PropertyType DWORD `
                 -Force | Out-Null

# Set SmartScreen enforcement level to Block (String)
New-ItemProperty -Path $RegistryPath `
                 -Name "ShellSmartScreenLevel" `
                 -Value "Block" `
                 -PropertyType String `
                 -Force | Out-Null
