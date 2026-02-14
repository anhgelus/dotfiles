# Pulsemeeter XBPS Package

This folder contains files for packaging [Pulsemeeter](https://github.com/theRealCarneiro/pulsemeeter) for Void Linux
using the XBPS package manager.

## Template File

The `template` file is an XBPS template for Pulsemeeter.

- Architecture: any
- Build style: python3-pep517

The patch `fix-asyncio-errors` was added to work with Python 3.14.
It will be removed when a fixed new version will be released.
Source: [theRealCarneiro/pulsemeeter#172](https://github.com/theRealCarneiro/pulsemeeter/pull/172).

## Installing

You have to build the package with `xbps-src`:
```bash
./xbps-src pkg pulsemeeter
```

You can update the package with:
```bash
# update the template file manually
# fetch source files
./xbps-src fetch pulsemeeter
# update checksum
xgensum -i pulsemeeter
# build the updated package
./xbps-src pkg pulsemeeter
```
If `xgensum` is not found, install the `xtools` package.
