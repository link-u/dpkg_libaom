#! /bin/bash -eu

set -eu

SCRIPT_PATH=$(readlink -f $(cd $(dirname $0) && pwd))
cd ${SCRIPT_PATH}
cd ..
cd libaom

fakeroot debian/rules clean
fakeroot debian/rules build
fakeroot debian/rules binary
