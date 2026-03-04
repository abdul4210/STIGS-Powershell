<#
.SYNOPSIS
    This PowerShell script enables enhanced anti-spoofing for facial recognition.

.NOTES
    Author          : Abdul Ali
    LinkedIn        : linkedin.com/in/abdul4210
    GitHub          : github.com/abdul4210
    Date Created    : 2026-03-01
    Last Modified   : 2026-03-01
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000195

.TESTED ON
    Date(s) Tested  : 2026-03-01
    Tested By       : Abdul Ali
    Systems Tested  : Windows 11 pro
    PowerShell Ver. : 5.1

.USAGE
Run as administrator
#>

# Enable Enhanced Anti-Spoofing for Facial Recognition

$RegistryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Biometrics\FacialFeatures"
$ValueName = "EnhancedAntiSpoofing"
$DesiredValue = 1


# Create registry path if it does not exist
if (-not (Test-Path $RegistryPath)) {
    New-Item -Path $RegistryPath -Force | Out-Null
}

# Create or update the required DWORD value
New-ItemProperty -Path $RegistryPath `
                 -Name $ValueName `
                 -Value $DesiredValue `
                 -PropertyType DWORD `
                 -Force | Out-Null
