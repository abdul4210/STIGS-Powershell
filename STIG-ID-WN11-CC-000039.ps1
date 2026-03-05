<#
.SYNOPSIS
    This PowerShell script removes "run as different user" from context menus

.NOTES
    Author          : Abdul Ali
    LinkedIn        : linkedin.com/in/abdul4210
    GitHub          : github.com/abdul4210
    Date Created    : 2026-03-05
    Last Modified   : 2026-03-05
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000039

.TESTED ON
    Date(s) Tested  : 2026-03-05
    Tested By       : Abdul Ali
    Systems Tested  : Windows 11 pro
    PowerShell Ver. : 5.1

.USAGE
Run as administrator
#>

# Remove "Run as different user" from context menus

$Paths = @(
"HKLM:\SOFTWARE\Classes\batfile\shell\runasuser",
"HKLM:\SOFTWARE\Classes\cmdfile\shell\runasuser",
"HKLM:\SOFTWARE\Classes\exefile\shell\runasuser",
"HKLM:\SOFTWARE\Classes\mscfile\shell\runasuser"
)

$ValueName = "SuppressionPolicy"
$DesiredValue = 4096


foreach ($Path in $Paths) {

    # Ensure registry path exists
    if (-not (Test-Path $Path)) {
        New-Item -Path $Path -Force | Out-Null
    }

    # Set required registry value
    New-ItemProperty -Path $Path `
                     -Name $ValueName `
                     -Value $DesiredValue `
                     -PropertyType DWORD `
                     -Force | Out-Null
}


New-ItemProperty -Path $RegistryPath `
                 -Name $ValueName `
                 -Value $DesiredValue `
                 -PropertyType DWORD `
                 -Force | Out-Null
