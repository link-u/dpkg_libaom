#! /bin/bash -eu

set -eu

SCRIPT_PATH=$(readlink -f $(cd $(dirname $0) && pwd))
cd ${SCRIPT_PATH}

env --chdir=../libaom fakeroot debian/rules clean
env --chdir=../libaom fakeroot debian/rules build
env --chdir=../libaom fakeroot debian/rules binary
