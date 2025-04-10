# NugetCertTirsvad

## Overview
`certTirsvad.PS1` is a PowerShell script designed to generate self-signed certificates for application or DLL signing. It automates the process of creating, exporting, and optionally installing certificates in the local certificate store. This is particularly useful for developers who need certificates for signing NuGet packages or other code artifacts.

## Features
- Generate self-signed certificates with customizable subject, organization, and validity period.
- Export certificates to both `.pfx` and `.cer` formats.
- Optionally install the certificate in the local machine's certificate store.
- Supports secure password protection for the `.pfx` file.

## Parameters
The script accepts the following parameters:

| Parameter              | Type         | Description                                                                 | Default Value              |
|------------------------|--------------|-----------------------------------------------------------------------------|----------------------------|
| `CertSubject`          | `string`     | The subject name of the certificate.                                        | `CN=SelfSignedNuGetCert`   |
| `CertOrganization`     | `string`     | The organization name for the certificate.                                  | `O=Jens Tirsvad Nielsen`   |
| `CertOrganizationUnit` | `string`     | The organization unit for the certificate.                                  | `OU=TirsvadCLI`            |
| `CertCountry`          | `string`     | The country code for the certificate.                                       | `C=MY`                     |
| `CertValidityYears`    | `int`        | The validity period of the certificate in years.                            | `5`                        |
| `PfxExportPath`        | `string`     | The output path for the exported `.pfx` file.                               | `Tirsvad.pfx`              |
| `CerExportPath`        | `string`     | The output path for the exported `.cer` file.                               | `Tirsvad.cer`              |
| `PfxPassword`          | `SecureString` | The password for the `.pfx` file.                                           | `SsR25BPowder`             |
| `InstallInStore`       | `bool`       | Whether to install the certificate in the local certificate store.          | `true`                     |

## Usage
1. Open PowerShell and navigate to the directory containing `certTirsvad.PS1`.
2. Run the script as administrator with default parameters:

.\certTirsvad.PS1 -CertSubject "CN=MyCert" -CertOrganization "O=MyOrg" -CertValidityYears 10 -PfxExportPath "MyCert.pfx" -CerExportPath "MyCert.cer" -PfxPassword (ConvertTo-SecureString -String "MySecurePassword" -AsPlainText -Force) -InstallInStore $false

## Output
- A `.pfx` file at the specified `PfxExportPath`.
- A `.cer` file at the specified `CerExportPath`.
- Optionally installs the certificate in the local machine's certificate store.
- Displays the certificate thumbprint in the console.

## Requirements
- Windows PowerShell 5.1 or later.
- Administrator privileges (required for installing certificates in the local store).

## Contributing
Contributions are welcome! Please fork the repository, make your changes, and submit a pull request.

## Acknowledgments
- Inspired by the need for automated certificate generation for NuGet package signing.
