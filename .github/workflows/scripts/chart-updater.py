"""
Simple python script that is used in github actions to
automatically bump chart dependencies using the updatecli CLI tool.
"""
 
from pathlib import Path
import subprocess
import yaml
import os
import traceback
 
# Add charts here where it is known that higher versions are not
# yet stable or that you would like to disable automatic upgrades for
EXCLUDED_CHARTS = []

# Inject a BUMP_MAJOR env variable if you would like the script to automatically
# bump major chart versions too. Make sure you inspect the upgrade instructions before merging!
BUMP_MAJOR = os.environ.get("BUMP_MAJOR") == "true"
 
def update_chart(path_chart: str):
   """
   Given a path to a helm chart. Bump the version of the dependencies of this chart
   if any newer versions exist.
   """
 
   with open(path_chart + "/Chart.yaml") as f:
       text = f.read()
 
   chart: dict = yaml.safe_load(text)
 
   if not "dependencies" in chart:
       return
 
   for i,dependency in enumerate(chart["dependencies"]):
      
       if dependency["name"] in EXCLUDED_CHARTS:
           print(f"Skipping {dependency['name']} because it is excluded..")
           continue
      
       # bump major or minor depending on set env variable
       version = f"{dependency['version'].split('.')[0]}.*.*" if not BUMP_MAJOR else "*.*.*"
       manifest = f"""
sources:
   lastMinorRelease:
       kind: helmChart
       spec:
           url: "{dependency["repository"]}"
           name: "{dependency["name"]}"
           version: "{version}"
conditions: {{}}
targets:
   chart:
       name: Bump Chart dependencies
       kind: helmChart
       spec:
           Name: "{path_chart}"
           file: "Chart.yaml"
           key: "dependencies[{i}].version"
           versionIncrement: "patch"
"""
 
       with open("manifest.yaml", "w") as f:
           f.write(manifest)
 
       subprocess.check_output("updatecli apply --config manifest.yaml".split(" "))
 
if __name__ == "__main__":
 
   # loop through all the charts and use updatecli
   # to bump the chart versions if a newer version exists
   paths = Path("charts")
   for path in paths.iterdir():
       try:
           update_chart(str(path.absolute()))
       except Exception as e:
           print(f"Failed processing chart {path}")
           print(traceback.format_exc())