#!/usr/bin/env bash

# look through all of the values.yaml files, and parse out dockerImage:tag values in a space-separated list

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

##
# steps (inline comments breaks bash)
# 1. Search through all values.yaml files for the strings `repository: mojaloop` and `tag:`
# 2. Remove leading and trailing whitespace
# 3. Collapse into one line, ensuring the pattern: `repo*\ntag:`
# 4. Remove the `repository:` string, Replace the ` tag: ` string with `:`
# 5-8. Remove repos that don't work with the license-scanner
# 9. Remove rows that are commented out in yaml (start with #)
# 10. Sort and remove duplicates
# 11. Collapse list into one line, separated with spaces
# 12. Remove any leading whitespace
##
cat ${DIR}/../**/values.yaml \
  | grep 'repository:.mojaloop\|tag:' \
  | awk '{$1=$1;print}' \
  | awk 'BEGIN{FS="   *"} f ~ "repo" && $1 ~ "tag" {print f" "$1} {f=$1}' \
  | sed -e "s/repository://g"  -e "s/ tag: /:/g" \
  | grep -v "mojaloop/documentation" \
  | grep -v "mojaloop/central-kms" \
  | grep -v "mojaloop/interop-switch" \
  | grep -v "mojaloop/forensic-logging-sidecar" \
  | grep -v "^#" \
  | sort -u \
  | tr -d '\n' \
  | awk '{$1=$1;print}'
