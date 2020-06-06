#! /bin/bash

set -eu

SCRIPT_PATH=$(readlink -f $(cd $(dirname $0) && pwd))
cd ${SCRIPT_PATH}
cd ..

codename=$(lsb_release -cs)

cp "scripts/changelog_template" "libaom/debian/changelog"
# replace date
sed -i -r "s/%DATE%/$(LC_ALL=C TZ=JST-9 date '+%a, %d %b %Y %H:%M:%S %z')/g" libaom/debian/changelog

# set debian package version
version=$(git -C libaom describe --tags "HEAD^" | sed 's/\(.*\)-.*/\1/')+patch
dpkg_version=${version:1}.$(TZ=JST-9 date +%Y%m%d)+${codename}
echo "::set-output name=version::${dpkg_version}"
sed -i -r "s/%VERSION%/${dpkg_version}/g" libaom/debian/changelog
