#! /bin/bash -eu

set -eu

SCRIPT_PATH=$(readlink -f $(cd $(dirname $0) && pwd))
cd ${SCRIPT_PATH}
cd ..

tag=$(git -C libaom describe --tags "HEAD^" | sed 's/\(.*\)-.*/\1/')+patch
git tag ${tag}
git push origin ${tag}
