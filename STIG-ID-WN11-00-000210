<#
.SYNOPSIS
    This PowerShell script disables bluetooth.

.NOTES
    Author          : Abdul Ali
    LinkedIn        : linkedin.com/in/abdul4210
    GitHub          : github.com/abdul4210
    Date Created    : 2026-02-28
    Last Modified   : 2026-02-28
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-00-000210

.TESTED ON
    Date(s) Tested  : 2026-02-28
    Tested By       : Abdul Ali
    Systems Tested  : Windows 11 pro
    PowerShell Ver. : 5.1

.USAGE
Run as administrator
#>

# Disable Bluetooth Services
$services = @(
    "bthserv",        # Bluetooth Support Service
    "BluetoothUserService"
)

foreach ($svc in $services) {
    Get-Service -Name $svc -ErrorAction SilentlyContinue | ForEach-Object {
        Stop-Service -Name $_.Name -Force -ErrorAction SilentlyContinue
        Set-Service -Name $_.Name -StartupType Disabled
    }
}

# Disable Bluetooth Devices
Get-PnpDevice -Class Bluetooth -Status OK -ErrorAction SilentlyContinue | ForEach-Object {
    Disable-PnpDevice -InstanceId $_.InstanceId -Confirm:$false
}
