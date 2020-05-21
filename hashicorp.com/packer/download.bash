#!/bin/bash

SCRIPTDIR="$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)"

download(){
  version='1.5.5'
  fname0="packer_${version}_linux_amd64.zip"
  fname1="packer_${version}_linux_arm64.zip"

  cd "${SCRIPTDIR}"
  git-annex addurl \
    --file "${fname0}" \
    "https://releases.hashicorp.com/packer/${version}/${fname0}"
  git-annex addurl \
    --file "${fname1}" \
    "https://releases.hashicorp.com/packer/${version}/${fname1}"
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  # Strict Mode
  set -euo pipefail
  IFS=$'\n\t'

  set -x
  download "$@"
fi
