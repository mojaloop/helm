#!/usr/bin/env bash

# look through all of the values.yaml files, and parse out dockerImage:tag values in a space-separated list

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cat ${DIR}/**/values.yaml \
  | grep '\ *repository:\|\ *tag:' \
  | awk '{$1=$1;print}' \
  | awk 'NR%2{printf "%s ",$0;next;}1' \
  | sed "s/repository://g" \
  | sed "s/ tag: /:/g" \
  | grep "mojaloop" \
  | grep -v "^#" \
  | sort -u \
  | tr -d '\n'