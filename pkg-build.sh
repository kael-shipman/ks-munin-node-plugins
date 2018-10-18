#!/bin/bash

set -e

function setup_env() {
    setup_deb_env $@
    builddir="pkg-build"
}

function place_files() {
    local pkgname="$1"
    local targdir="$2"
    local pkgtype="$3"

    if [ "$pkgname" == "ks-munin-node-plugins" ]; then
        mkdir -p "$targdir/usr/share/munin/plugins"
        cp -R src/* "$targdir/usr/share/munin/plugins/"
    else
        >&2 echo
        >&2 echo "E: Don't know how to place files for package $pkgname"
        >&2 echo
        exit 14
    fi
}

function build_package() {
    pkgtype="$1"
    shift

    if [ "$pkgtype" == "deb" ]; then
        build_deb_package $@
    else
        >&2 echo
        >&2 echo "E: Don't know how to build packages of type '$pkgtype'"
        >&2 echo
        exit 11
    fi
}

. /usr/lib/ks-std-libs/libpkgbuilder.sh
build

