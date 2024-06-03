# Connect to Azure AD
Connect-AzureAD

# Read the emails from the file
#------------------------------------
$emails = Get-Content -Path "emails.txt" # Replace "data.txt" with the path to your file
#------------------------------------
# Print the header
Write-Output "------------------------------------"
Write-Output "Users without SPE_F1 or EMS licenses: "
Write-Output " "
Write-Output "------------------------------------"

# Iterate over each email
foreach ($email in $emails) {
    # Get the user's licenses
    $licenses = Get-AzureADUserLicenseDetail -ObjectId $email

    # Initialize a flag to False
    $containsLicense = $false

    # Iterate through each license and check if it contains "SPE_F1" or "EMS" (Contains F3 or E3 License)
    foreach ($license in $licenses) {
        if ($license.SkuPartNumber -eq "SPE_F1" -or $license.ServicePlans.ServicePlanName -contains "SPE_F1" -or $license.SkuPartNumber -eq "EMS" -or $license.ServicePlans.ServicePlanName -contains "EMS") {
            $containsLicense = $true
            break
        }
    }

    # If the user has the license, print the email
    if (-not $containsLicense) {
        Write-Output $email
    }
}

# Disconnect from Azure AD
Disconnect-AzureAD

# Print the footer
Write-Output "------------------------------------"

# To put in text file use: .\license_checker.ps1 > NAME.txt 
