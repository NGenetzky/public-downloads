#!/bin/bash

SCRIPTDIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P)"

download(){
  cd "${SCRIPTDIR}"
  git-annex addurl \
    "http://cdimage.ubuntu.com/kubuntu/releases/18.04/release/kubuntu-18.04.1-desktop-amd64.iso" \
    --file "kubuntu-18.04.1-desktop-amd64.iso"
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  # Strict Mode
  set -euo pipefail
  IFS=$'\n\t'

  set -x
  download "$@"
fi
