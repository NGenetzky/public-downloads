#!/bin/bash

SCRIPTDIR="$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)"

download(){
  version='2.2.9'
  fname0="vagrant_${version}_x86_64.deb"

  cd "${SCRIPTDIR}"
  git-annex addurl \
    --file "${fname0}" \
    "https://releases.hashicorp.com/vagrant/${version}/${fname0}"
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  # Strict Mode
  set -euo pipefail
  IFS=$'\n\t'

  set -x
  download "$@"
fi
