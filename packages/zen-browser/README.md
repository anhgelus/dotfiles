# Zen Browser XBPS Package

This folder contains files for packaging [Zen Browser](https://zen-browser.app/) for Void Linux using the XBPS package
manager.

## Template File

The `template` file is an XBPS template for Zen Browser.

- Architecture: x86_64 only
- Build style: precompiled binaries

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
```bash
# update the template file manually
# fetch source files
./xbps-src fetch zen-browser
# update checksum
xgensum -i zen-browser
# build the updated package
./xbps-src pkg zen-browser
```
If `xgensum` is not found, install the `xtools` package.
