#!/usr/bin/env bash

# look through all of the values.yaml files, and parse out dockerImage:tag values in a space-separated list

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

##
# steps (inline comments breaks bash)
# 1. Search through all values.yaml files for the strings `repository:` and `tag:`
# 2. Remove leading whitespace
# 3. Collapse into one line
# 4. Remove the `repository:` string, Replace the ` tag: ` string with `:`
# 5. Remove rows that don't contain 'mojaloop'
# 6. Remove rows that are commented out in yaml (start with #)
# 7. Sort and remove duplicates
# 8. Collapse list into one line, separated with spaces
# 9. Remove any leading whitespace
##

cat ${DIR}/**/values.yaml \
  | grep '\ *repository:\|\ *tag:' \
  | awk '{$1=$1;print}' \
  | awk 'NR%2{printf "%s ",$0;next;}1' \
  | sed -e "s/repository://g"  -e "s/ tag: /:/g" \
  | grep "mojaloop" \
  | grep -v "^#" \
  | sort -u \
  | tr -d '\n' \
  | awk '{$1=$1;print}'