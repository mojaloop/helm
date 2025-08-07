#!/usr/bin/env node

const fs = require('fs');
const path = require('path');
const YAML = require('yaml');

/**
 * Sync subchart values with parent chart values
 * Usage: node sync-subchart-values.js <parent-chart-path>
 * Example: node sync-subchart-values.js ./centralledger
 * 
 * Note: This script will preserve configuration values and the 'enabled' parameter
 * positioning, but YAML comments will be lost during the sync process. This is
 * a limitation of YAML parsing libraries that prioritize data integrity over
 * comment preservation.
 */

function readYamlFile(filePath) {
  try {
    const content = fs.readFileSync(filePath, 'utf8');
    return YAML.parse(content);
  } catch (error) {
    console.error(`Error reading ${filePath}:`, error.message);
    return null;
  }
}

function writeYamlFile(filePath, data) {
  try {
    const yamlContent = YAML.stringify(data, {
      indent: 2,
      lineWidth: 0,
      minContentWidth: 0,
      commentString: '#',
      nullStr: 'null',
      simpleKeys: false
    });
    fs.writeFileSync(filePath, yamlContent, 'utf8');
    return true;
  } catch (error) {
    console.error(`Error writing ${filePath}:`, error.message);
    return false;
  }
}

function removeGlobalSection(obj) {
  if (obj && typeof obj === 'object') {
    if (Array.isArray(obj)) {
      return obj.map(removeGlobalSection);
    } else {
      const newObj = {};
      for (const [key, value] of Object.entries(obj)) {
        if (key !== 'global') {
          newObj[key] = removeGlobalSection(value);
        }
      }
      return newObj;
    }
  }
  return obj;
}

function syncSubchartValues(parentChartPath) {
  const chartYamlPath = path.join(parentChartPath, 'Chart.yaml');
  const parentValuesPath = path.join(parentChartPath, 'values.yaml');

  // Read parent Chart.yaml
  const chartData = readYamlFile(chartYamlPath);
  if (!chartData) {
    console.error(`Failed to read Chart.yaml from ${parentChartPath}`);
    return false;
  }

  // Read parent values.yaml
  const parentValues = readYamlFile(parentValuesPath);
  if (!parentValues) {
    console.error(`Failed to read values.yaml from ${parentChartPath}`);
    return false;
  }

  if (!chartData.dependencies) {
    console.log('No dependencies found in Chart.yaml');
    return true;
  }

  let hasChanges = false;

  // Process each dependency
  for (const dependency of chartData.dependencies) {
    const subchartName = dependency.name;
    
    // Determine the actual subchart folder path
    let subchartFolderName = subchartName;
    if (dependency.repository && dependency.repository.startsWith('file://./')) {
      // Extract folder name from repository path (e.g., "file://./chart-service" -> "chart-service")
      subchartFolderName = dependency.repository.replace('file://./', '');
    }
    
    const subchartPath = path.join(parentChartPath, subchartFolderName);
    
    // Check if subchart folder exists
    if (!fs.existsSync(subchartPath) || !fs.statSync(subchartPath).isDirectory()) {
      console.log(`Skipping ${subchartName}: folder ${subchartFolderName} not found`);
      continue;
    }

    const subchartValuesPath = path.join(subchartPath, 'values.yaml');
    
    // Check if subchart values.yaml exists
    if (!fs.existsSync(subchartValuesPath)) {
      console.log(`Skipping ${subchartName}: values.yaml not found`);
      continue;
    }

    // Read subchart values
    const subchartValues = readYamlFile(subchartValuesPath);
    if (!subchartValues) {
      console.log(`Skipping ${subchartName}: failed to read values.yaml`);
      continue;
    }

    // Remove global section from subchart values
    const cleanedSubchartValues = removeGlobalSection(subchartValues);

    // Initialize parent section if it doesn't exist
    if (!parentValues[subchartName]) {
      parentValues[subchartName] = {};
    }

    // Preserve the enabled value if it exists (could be true, false, or undefined)
    const wasEnabled = parentValues[subchartName].enabled;

    // Create new section with enabled at the beginning if it was previously set
    const newSection = {};
    
    // Add enabled first if it was previously set
    if (wasEnabled !== undefined) {
      newSection.enabled = wasEnabled;
    }
    
    // Then add all other properties from subchart values, except enabled
    for (const [key, value] of Object.entries(cleanedSubchartValues)) {
      if (key !== 'enabled') {
        newSection[key] = value;
      }
    }
    
    // If enabled wasn't previously set in parent, add it from subchart (if it exists)
    if (wasEnabled === undefined && cleanedSubchartValues.enabled !== undefined) {
      // Move enabled to the beginning
      const { enabled, ...rest } = newSection;
      parentValues[subchartName] = { enabled: cleanedSubchartValues.enabled, ...rest };
    } else {
      parentValues[subchartName] = newSection;
    }

    console.log(`✓ Synced ${subchartName}`);
    hasChanges = true;
  }

  // Write back the updated parent values
  if (hasChanges) {
    if (writeYamlFile(parentValuesPath, parentValues)) {
      console.log(`✓ Updated ${parentValuesPath}`);
      return true;
    } else {
      console.error(`Failed to write ${parentValuesPath}`);
      return false;
    }
  } else {
    console.log('No changes made');
    return true;
  }
}

function main() {
  const args = process.argv.slice(2);
  
  if (args.length === 0) {
    console.log('Usage: node sync-subchart-values.js <parent-chart-path>');
    console.log('Example: node sync-subchart-values.js ./centralledger');
    process.exit(1);
  }

  const parentChartPath = args[0];
  
  if (!fs.existsSync(parentChartPath)) {
    console.error(`Parent chart path does not exist: ${parentChartPath}`);
    process.exit(1);
  }

  if (!fs.statSync(parentChartPath).isDirectory()) {
    console.error(`Parent chart path is not a directory: ${parentChartPath}`);
    process.exit(1);
  }

  console.log(`Syncing subchart values for: ${parentChartPath}`);
  
  const success = syncSubchartValues(parentChartPath);
  
  if (success) {
    console.log('✓ Sync completed successfully');
    process.exit(0);
  } else {
    console.log('✗ Sync failed');
    process.exit(1);
  }
}

if (require.main === module) {
  main();
}

module.exports = { syncSubchartValues };
