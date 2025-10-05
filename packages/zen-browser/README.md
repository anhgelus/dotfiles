# Zen Browser XBPS Package

This folder contains files for packaging Zen Browser for Void Linux using the XBPS package manager.

## Files

1. `template`: XBPS template file for Zen Browser
2. `files/update-template.sh`: Script to update the Zen Browser XBPS template

## Template File

The `template` file is an XBPS template for Zen Browser.

- Architecture: x86_64 only
- Build style: precompiled binaries

The template file handles the installation of precompiled binaries and sets up the necessary dependencies.

## Update Script

The `update-template.sh` script automates the process of updating the Zen Browser XBPS template. It performs the following tasks:

1. Fetches the latest release version from the Zen Browser GitHub repository
2. Updates the version in the template file
3. Updates the checksums
4. Installs the updated Zen Browser package

### Prerequisites

To use the update script, you need:

- vpsm
- xbps-src
- curl
- sed
- sh

### Usage

To update the Zen Browser package:

1. Ensure you have met all prerequisites
2. Run the update script:
   ```sh
   chmod +x files/update-template.sh
   ./files/update-template.sh
   ```

## Contributing

If you want to contribute to this package, please make sure to test your changes thoroughly before submitting a pull request.

This is a fork of https://github.com/salastro/zen-browser.

## Issues

If you encounter any issues with the package or the update script, please open an issue in this repository.
