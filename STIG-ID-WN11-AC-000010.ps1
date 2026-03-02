<#
.SYNOPSIS
    This PowerShell limits the number of failed login attempts to three.

.NOTES
    Author          : Abdul Ali
    LinkedIn        : linkedin.com/in/abdul4210
    GitHub          : github.com/abdul4210
    Date Created    : 2026-02-26
    Last Modified   : 2026-02-26
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AC-000010

.TESTED ON
    Date(s) Tested  : 2026-02-26
    Tested By       : Abdul Ali
    Systems Tested  : Windows 11 pro
    PowerShell Ver. : 5.1

.USAGE
Run as administrator
#>

# Configure Account Lockout Threshold to 3 invalid attempts

$LockoutThreshold = 3
$LockoutDuration = 15      # Minutes (recommended baseline value)
$LockoutWindow = 15        # Minutes (reset counter after)

# Apply account lockout settings
net accounts /lockoutthreshold:$LockoutThreshold
net accounts /lockoutduration:$LockoutDuration
net accounts /lockoutwindow:$LockoutWindow
