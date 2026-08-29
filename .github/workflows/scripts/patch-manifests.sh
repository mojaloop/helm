# Applies package versions override to manifests using versions from the package.yaml file 
# Usage: patch-manifests.sh <package.yaml> <manifests-dir>
# Example: patch-manifests.sh patch-manifests.sh .github/workflows/manifests/package.yaml .github/workflows/manifests/first-pass

set -e

# Read and parse package.yaml file and store as assiciative array
declare -A package
while IFS=': ' read -r key value; do
    if [ -n "$key" ] && [ -n "$value" ]; then
        package[$key]=$value
    fi
done < $1

# Exit if there are no items in package array
if [ ${#package[@]} -eq 0 ]; then
    echo "No package specifications in package.yaml file"
    exit 0
fi

# Iterate over all the files in the directory
for file in $2/*; do
    # Check if the file is a yaml file and filename is not package.yaml
    if [ ${file: -5} == ".yaml" ] && [ ${file: -13} != "/package.yaml" ]; then
        # Iterate over all the keys in the package.yaml file
        for key in "${!package[@]}"; do
            version=$(echo ${package[$key]} | tr -d '[:space:]')
            yq eval -i '(.sources[] | select(.spec.repository == "'$key'"  or .spec.name == "'$key'") | .spec) += { "versionfilter": { "kind": "semver",  "pattern": "'$version'" } }' $file
        done
    fi
done

# TODO:
# # Iterate over all the files in the directory and remove the .versionfilter node for any source that is not in the package.yaml file
# for file in $2/*; do
#     # Check if the file is a yaml file and filename is not package.yaml
#     if [ ${file: -5} == ".yaml" ] && [ ${file: -13} != "/package.yaml" ]; then
#         # Iterate over all the keys in the package.yaml file
#         for key in "${!package[@]}"; do
#             yq eval -i 'del(.sources[] | select(.spec.repository != "'$key'" and .spec.name != "'$key'") | .versionfilter)' $file
#         done
#     fi
# done


