#!/usr/bin/env bash

#
# Prints the chart directories this branch changes relative to origin/main,
# one per line, closed over the local file:// dependency graph: a change to a
# subchart lists every chart that vendors it, so an umbrella republishes when
# anything inside it moves. Exits non-zero when no merge base can be resolved,
# so callers keep their full chart list.
#

set -eo pipefail

git fetch --quiet origin main 2>/dev/null || true
BASE=$(git merge-base HEAD origin/main 2>/dev/null) || {
    echo "changed-charts: no merge base with origin/main" >&2
    exit 1
}

# Chart directories in the tree, vendored dependencies excluded. BusyBox
# find, so no -printf and ! instead of -not.
mapfile -t dirs < <(find . -maxdepth 3 -name Chart.yaml ! -path '*/charts/*' | sed 's|/Chart.yaml$||; s|^\./||' | sort)
[ "${#dirs[@]}" -gt 0 ] || {
    echo "changed-charts: found no chart directories" >&2
    exit 1
}

declare -A changed=()
while IFS= read -r file; do
    for dir in "${dirs[@]}"; do
        case "$file" in
            "$dir"/*) changed["$dir"]=1 ;;
        esac
    done
done < <(git diff --name-only "$BASE"...HEAD)

# Close over file:// dependencies until nothing new joins
grew=1
while [ "$grew" = 1 ]; do
    grew=0
    for dir in "${dirs[@]}"; do
        [ -n "${changed[$dir]:-}" ] && continue
        while IFS= read -r dep; do
            target=$(cd "$dir" 2>/dev/null && cd "${dep#file://}" 2>/dev/null && pwd) || continue
            rel=${target#"$PWD"/}
            if [ -n "${changed[$rel]:-}" ]; then
                changed["$dir"]=1
                grew=1
                break
            fi
        done < <(grep -o 'file://[^"'\'' ]*' "$dir/Chart.yaml" 2>/dev/null || true)
    done
done

for dir in "${dirs[@]}"; do
    [ -n "${changed[$dir]:-}" ] && echo "$dir"
done
exit 0
