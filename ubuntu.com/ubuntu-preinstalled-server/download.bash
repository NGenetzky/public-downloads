#!/bin/bash
# http://cdimage.ubuntu.com/releases/

SCRIPTDIR="$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)"

download(){
  version='20.04'
  fname0="ubuntu-${version}-preinstalled-server-arm64+raspi.img.xz"
  fname1="ubuntu-${version}-preinstalled-server-armhf+raspi.img.xz"

  cd "${SCRIPTDIR}"
  git-annex addurl \
    --file "${fname0}" \
    "http://cdimage.ubuntu.com/releases/${version}/release/${fname0}"
  git-annex addurl \
    --file "${fname1}" \
    "http://cdimage.ubuntu.com/releases/${version}/release/${fname1}"
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  # Strict Mode
  set -euo pipefail
  IFS=$'\n\t'

  set -x
  download "$@"
fi
