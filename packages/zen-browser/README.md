# Zen Browser XBPS Package

This folder contains files for packaging Zen Browser for Void Linux using the XBPS package manager.

## Template File

The `template` file is an XBPS template for Zen Browser.

- Architecture: x86_64 only
- Build style: precompiled binaries

The template file handles the installation of precompiled binaries and sets up the necessary dependencies.

## Installing 

You have to build the package with `xbps-src`:
```bash
./xbps-src pkg zen-browser
```

You can check updates with:
```bash
./xbps-src -v update-check zen-browser
```

You can update the package with:
```
xgensum -i zen-browser
# to build the updated package
./xbps-src pkg zen-browser
```
If `xgensum` is not found, install the `xtools` package.
