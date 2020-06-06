#! /bin/bash -eux

set -eux

SCRIPT_PATH=$(readlink -f $(cd $(dirname $0) && pwd))
cd ${SCRIPT_PATH}
cd ..

bash scripts/create_changelog.sh

apt-get install -y --no-install-recommends devscripts debmake equivs
# install dependencies
mk-build-deps --install --remove \
  --tool='apt-get -o Debug::pkgProblemResolver=yes --no-install-recommends --yes' \
  libaom/debian/control

bash scripts/build.sh
