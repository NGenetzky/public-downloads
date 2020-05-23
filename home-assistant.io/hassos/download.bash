#!/bin/bash

SCRIPTDIR="$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)"

download(){
    version='3.13'
    fname0="hassos_rpi3-${version}.img.gz"
    fname1="hassos_rpi4-${version}.img.gz"
    version1='4.6'
    fname2="hassos_ova-${version1}.qcow2.gz"

    cd "${SCRIPTDIR}"
    git-annex addurl \
        --file "${fname0}" \
        "https://github.com/home-assistant/operating-system/releases/download/${version}/${fname0}"
    git-annex addurl \
        --file "${fname1}" \
        "https://github.com/home-assistant/operating-system/releases/download/${version}/${fname1}"
    git-annex addurl \
        --file "${fname2}" \
        "https://github.com/home-assistant/operating-system/releases/download/${version1}/${fname2}"
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    # Strict Mode
    set -euo pipefail
    IFS=$'\n\t'

    set -x
    download "$@"
fi
