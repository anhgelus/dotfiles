#!/usr/bin/bash

# Script to update Zen Browser xbps-src template
#
# Required: xbps-src, curl, sed, xtools
#
# You have to set XBPS_DISTDIR
# Example: export XBPS_DISTDIR="$HOME/.void-packages"

void_packages="../.."

release_url=$(curl -Ls -o /dev/null -w '%{url_effective}' https://github.com/zen-browser/desktop/releases/latest)
release_tag=$(basename "$release_url" | sed 's/-//g')
echo "Downloading Zen Browser $release_tag"

sed -i 's/version=[a-zA-Z0-9.-]\+/version='"$release_tag"'/' "$void_packages/srcpkgs/zen-browser/template" && \
	echo "Updated version in template to $release_tag"

xgensum -i zen-browser && echo "Checksums generated for Zen Browser"

$void_packages/xbps-src fetch zen-browser

$void_packages/xbps-src pkg zen-browser && echo "Zen Browser package built"

