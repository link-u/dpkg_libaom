#! /bin/bash

env --chdir libaom-git dpkg-buildpackage -j3 -uc -us

