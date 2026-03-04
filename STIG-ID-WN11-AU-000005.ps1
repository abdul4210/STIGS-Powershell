<#
.SYNOPSIS
    This PowerShell script enables auditing of account logon credential validation failures.

.NOTES
    Author          : Abdul Ali
    LinkedIn        : linkedin.com/in/abdul4210
    GitHub          : github.com/abdul4210
    Date Created    : 2026-03-01
    Last Modified   : 2026-03-01
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AU-000005

.TESTED ON
    Date(s) Tested  : 2026-03-01
    Tested By       : Abdul Ali
    Systems Tested  : Windows 11 pro
    PowerShell Ver. : 5.1

.USAGE
Run as administrator
#>

# Configure Audit Account Logon - Credential Validation (Failure)

# Enable force audit policy subcategory override
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" `
    /v SCENoApplyLegacyAuditPolicy `
    /t REG_DWORD `
    /d 1 `
    /f | Out-Null

# Enable auditing for Credential Validation - Failure
AuditPol /set /subcategory:"Credential Validation" /failure:enable | Out-Null

# Display current configuration for verification
Write-Host "`nCurrent Setting:"
AuditPol /get /subcategory:"Credential Validation"
