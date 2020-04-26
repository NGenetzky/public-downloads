#!/bin/bash

SCRIPTDIR="$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)"

download(){
  version='20.04'
  fname0="ubuntu-${version}-desktop-amd64.iso"
  fname1="ubuntu-${version}-live-server-amd64.iso"
  fname2="ubuntu-${version}-live-server-arm64.iso"

  cd "${SCRIPTDIR}"
  git-annex addurl \
    --file "${fname0}" \
    "http://releases.ubuntu.com/${version}/${fname0}"
  git-annex addurl \
    --file "${fname1}" \
    "http://releases.ubuntu.com/${version}/${fname1}"
  git-annex addurl \
    --file "${fname2}" \
    "http://cdimage.ubuntu.com/releases/${version}/release/${fname2}"
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  # Strict Mode
  set -euo pipefail
  IFS=$'\n\t'

  set -x
  download "$@"
fi
