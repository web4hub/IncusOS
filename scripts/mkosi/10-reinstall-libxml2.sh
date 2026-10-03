#!/bin/sh -eu

[ "$1" = "final" ] || exit 0

# The base image deliberately drops libxml2 (only reachable through systemd's optional libarchive
# use), while dpkg still considers it installed. Applications that need it must reinstall it so
# the files end up in the application image, as they did before the base gained the package.
# This runs before the application packages are installed as their maintainer scripts may need it.
mkosi-reinstall libxml2
