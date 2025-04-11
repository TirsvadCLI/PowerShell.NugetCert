[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]

# ![Logo][Logo] Nuget Selfsigned Certificate

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

### Prerequisites
- PowerShell 5.1 or later.
- Administrator privileges (required for installing certificates in the local store).

### Steps

#### Downloading the Script
To get started with `certTirsvad.PS1`, we need to download the script and run it. You can do this in two ways: using Git or downloading the script directly.

##### Using git clone:
```bash
git clone https://github.com/TirsvadCLI/PowerShell.NugetCert.git
```

##### Using GitHub CLI:
```bash
gh repo clone TirsvadCLI/PowerShell.NugetCert
```

##### Using PowerShell:
```powershell
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/TirsvadCLI/PowerShell.NugetCert/refs/heads/main/certTirsvad.PS1" -OutFile "certTirsvad.PS1"
```

#### Running the Script

1. Open PowerShell and navigate to the directory containing `certTirsvad.PS1`.
2. Run the script as administrator with default parameters:

.\certTirsvad.PS1 -CertSubject "CN=MyCert" -CertOrganization "O=MyOrg" -CertValidityYears 10 -PfxExportPath "MyCert.pfx" -CerExportPath "MyCert.cer" -PfxPassword (ConvertTo-SecureString -String "MySecurePassword" -AsPlainText -Force) -InstallInStore $false

### Output
- A `.pfx` file at the specified `PfxExportPath`.
- A `.cer` file at the specified `CerExportPath`.
- Optionally installs the certificate in the local machine's certificate store.
- Displays the certificate thumbprint in the console.

## Contributing
Contributions are welcome! Please fork the repository, make your changes, and submit a pull request.

## Acknowledgments
- Inspired by the need for automated certificate generation for NuGet package signing.

<!-- MARKDOWN LINKS & IMAGES -->
[contributors-shield]: https://img.shields.io/github/contributors/TirsvadCLI/PowerShell.NugetCert?style=for-the-badge
[contributors-url]: https://github.com/TirsvadCLI/PowerShell.NugetCert/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/TirsvadCLI/PowerShell.NugetCert?style=for-the-badge
[forks-url]: https://github.com/TirsvadCLI/PowerShell.NugetCert/network/members
[stars-shield]: https://img.shields.io/github/stars/TirsvadCLI/PowerShell.NugetCert?style=for-the-badge
[stars-url]: https://github.com/TirsvadCLI/PowerShell.NugetCert/stargazers
[issues-shield]: https://img.shields.io/github/issues/TirsvadCLI/PowerShell.NugetCert?style=for-the-badge
[issues-url]: https://github.com/TirsvadCLI/PowerShell.NugetCert/issues
[license-shield]: https://img.shields.io/github/license/TirsvadCLI/PowerShell.NugetCert?style=for-the-badge
[license-url]: https://github.com/TirsvadCLI/PowerShell.NugetCert/blob/master/LICENSE
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://www.linkedin.com/in/jens-tirsvad-nielsen-13b795b9/

[Logo]: https://raw.githubusercontent.com/TirsvadCLI/PowerShell.NugetCert/master/image/logo/32x32/logo.png
