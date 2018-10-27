#!/bin/bash

SCRIPTDIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P)"

download(){
  local version="${1-1.0.114}"

  cd "${SCRIPTDIR}"

  git-annex addurl \
    "https://github.com/laurent22/joplin/releases/download/v${version}/Joplin-${version}-x86_64.AppImage" \
    --file "Joplin-${version}-x86_64.AppImage"
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  # Strict Mode
  set -euo pipefail
  IFS=$'\n\t'

  download "$@"
fi
