#!/bin/bash

SCRIPTDIR="$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)"

download(){
  version0='bionic'
  version1='20200521'
  fname0="${version0}-server-cloudimg-amd64.img"


  cd "${SCRIPTDIR}"
  git-annex addurl \
    --file "${fname0}" \
    "https://cloud-images.ubuntu.com/${version0}/${version1}/${version0}-server-cloudimg-amd64.img"
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  # Strict Mode
  set -euo pipefail
  IFS=$'\n\t'

  set -x
  download "$@"
fi
