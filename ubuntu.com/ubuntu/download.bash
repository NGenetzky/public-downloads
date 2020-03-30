#!/bin/bash

SCRIPTDIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P)"

download(){
  local fname
  fname0='ubuntu-19.04-desktop-amd64.iso'
  fname1='ubuntu-19.04-live-server-amd64.iso'

  cd "${SCRIPTDIR}"
  git-annex addurl --fast \
    --file "${fname0}" \
    "http://releases.ubuntu.com/19.04/${fname0}"
  git-annex addurl --fast \
    --file "${fname1}" \
    "http://releases.ubuntu.com/19.04/${fname1}"
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  # Strict Mode
  set -euo pipefail
  IFS=$'\n\t'

  set -x
  download "$@"
fi
