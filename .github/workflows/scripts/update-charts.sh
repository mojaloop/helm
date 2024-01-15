# first pass - update with github releases and published helm charts
updatecli apply --config .github/workflows/manifests/first-pass

# second pass - update with locally referenced charts
# runs the second-pass manifests repeatedly until no changes are detected
>output.log 
pass_count=0
# repeatedly run the second-pass manifests until no changes are detected
while ! (grep -q "* Changed:	0" output.log); do
    echo -e "\nUpdating charts ... pass: $((++pass_count))\n"
    ./update-charts-dep.sh 
    find . -maxdepth 1 -type d -not -path '*/\.*' | sed 's/^\.\///g' | xargs -I {} helm repo index {} 
    updatecli apply --config .github/workflows/manifests/second-pass |& tee output.log
    sleep 5
done