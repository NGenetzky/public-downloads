#!/bin/sh
set -eu

fname='nitrux-release-minimal-amd64_2021.05.01.iso'
datalad download-url -O "${fname}" "https://sourceforge.net/projects/nitruxos/files/Release/${fname}/download"
fname='nitrux-release-amd64_2021.05.01.iso'
datalad download-url -O "${fname}" "https://sourceforge.net/projects/nitruxos/files/Release/${fname}/download"
