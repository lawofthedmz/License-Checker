# Azure AD License Checker

This PowerShell script checks if users in Azure Active Directory (Azure AD) have specific licenses.

## How it works

The script reads a list of email addresses from a text file named `data.txt`. Each email address should be on a separate line.

For each email address, the script retrieves the user's licenses from Azure AD. It then checks each license to see if its `SkuPartNumber` or any of its `ServicePlanName`s contain "SPE_F1" or "EMS".

If a user does not have either the "SPE_F1" or "EMS" licenses, the script prints the user's email address.

## How to run the script

1. Open PowerShell.
2. Navigate to the directory where the script is located using the `cd` command.
3. Run the script with the `.\script.ps1` command.

Please note that you need to have the AzureAD PowerShell module installed to run this script. You can install it with the `Install-Module -Name AzureAD` command.

## Requirements

- PowerShell
- AzureAD PowerShell module
- A text file named `data.txt` with one email address per line