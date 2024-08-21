/**
 * This script exports the version of the SDK from the sfdx-project.json to a class in the source.
 */

const fs = require('fs');
const path = require('path');

// Read the version from sfdx-project.json
const sfdxJsonPath = path.join(__dirname, '..', '..', 'sfdx-project.json');
const sfdxJson = require(sfdxJsonPath);
const version = sfdxJson.packageDirectories[0].versionNumber;
const today = new Date();
const formattedDate = today.toISOString().split('T')[0];

// Create the output string
const comment = `/**
 * @description       : Nylas Apex SDK Version, generated by scripts/js/exportVersion.js.
 * @author            : exportVersion.js
 * @last modified on  : ${formattedDate}
 * @last modified by  : exportVersion.js
 **/
`;
const classStr = `public class PackageVersion {
  public static final String VERSION_NUMBER = '${version}';
}\n`;
const output = comment + classStr;

// Write the output to src/version.js
const outputPath = path.join(
    __dirname,
    '..',
    '..',
    'force-app',
    'main',
    'default',
    'classes',
    'config',
    'NylasVersion.cls'
);
fs.writeFileSync(outputPath, output);