#!/usr/bin/env bash

set -euo pipefail

GH_REPO="https://github.com/firebase/firebase-tools"

function fail() {
    printf "🚨  %s\\n" "${1}"
    exit 1
}

function get_os() {
    UNAME=$(uname -s | tr '[:upper:]' '[:lower:]')

    # Then we map the output to the names used on the Github releases page
    case "$UNAME" in
    linux*) MACHINE=linux ;;
    darwin*) MACHINE=macos ;;
    esac

    echo "${MACHINE}"
}

function sort_versions() {
    sed 'h; s/[+-]/./g; s/.p\([[:digit:]]\)/.z\1/; s/$/.z/; G; s/\n/ /' |
        LC_ALL=C sort -t. -k 1,1 -k 2,2n -k 3,3n -k 4,4n -k 5,5n | awk '{print $2}'
}
