param(
    # The subject name of the certificate
    [string]$CertSubject = "CN=SelfSignedNuGetCert",
    # The organzization name for the certificate
    [string]$CertOrganization = "",
    # The organization unit for the certificate
    [String]$CertOrganizationUnit = "",
    # The country code for the certificate
    [string]$CertCountry = "",
    # The validity period of the certificate in years
    [int]$CertValidityYears = 5,
    # The output path for the exported PFX file
    [string]$PfxExportPath = "SelfSignedCertificate.pfx",
    # The output path for the exported CER file
    [string]$CerExportPath = "SelfSignedCertificate.cer",
    # The password for the PFX file
    [string]$PfxPassword = "Secret",
    # Whether to install the certificate in the local certificate store
    [bool]$InstallInStore = $true
)

# Generate the self-signed certificate
Write-Output "Generating self-signed certificate for application/DLL signing..."
$cert = New-SelfSignedCertificate -Subject "$CertSubject, $CertOrganization, $CertOrganizationUnit, $CertCountry" -Type CodeSigningCert -KeyExportPolicy Exportable -KeyLength 2048 -HashAlgorithm SHA256 -NotAfter (Get-Date).AddYears($CertValidityYears)

if (-not $cert) {
    Write-Error "Failed to generate the self-signed certificate."
    exit 1
}

Write-Output "Certificate generated successfully."

# Export the certificate to a PFX file
Write-Output "Exporting the certificate to a PFX file..."
$securePassword = ConvertTo-SecureString -String $PfxPassword -Force -AsPlainText
Export-PfxCertificate -Cert $cert -FilePath $PfxExportPath -Password $securePassword

if (-not (Test-Path $PfxExportPath)) {
    Write-Error "Failed to export the certificate to a PFX file."
    exit 1
}

Write-Output "Certificate exported successfully to: $PfxExportPath"

# Export the certificate to a CER file
Write-Output "Exporting the certificate to a CER file..."
$certPath = "Cert:\LocalMachine\My\$($cert.Thumbprint)"
$certObject = Get-Item $certPath
Export-Certificate -Cert $certObject -FilePath $CerExportPath -Type CERT

if (-not (Test-Path $CerExportPath)) {
    Write-Error "Failed to export the certificate to a CER file."
    exit 1
}

Write-Output "Certificate exported successfully to: $CerExportPath"

# Optionally install the certificate in the local certificate store
if ($InstallInStore) {
    Write-Output "Installing the certificate in the local certificate store..."
    $store = New-Object System.Security.Cryptography.X509Certificates.X509Store("My", "LocalMachine")
    $store.Open("ReadWrite")
    $store.Add($cert)
    $store.Close()
    Write-Output "Certificate installed successfully in the local certificate store."
}

# Output the certificate thumbprint
Write-Output "Certificate Thumbprint: $($cert.Thumbprint)"
