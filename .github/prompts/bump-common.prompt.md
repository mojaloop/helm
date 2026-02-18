Updating dependencies

Pass 1: Update all Chart.yaml files which reference the common chart from https://mojaloop.github.io/charts/repo to refer to version 3.1.6. For all updated charts, bump their patch version.

Pass 2: Update the local cross references, i.e. the charts which refer to other local ones with "repository: "file://....." - they need to update their version patterns.
