#!/bin/bash

# fail if any commands fails
set -e

set -x

# Exists if no provided parameters.
if [ -z "${project_path}" ]; then
  echo "[ERROR] Missing required input: project_path"
  exit 1
fi

if [ -z "${new_icon_name}" ]; then
  echo "[ERROR] Missing required input: new_icon_name"
  exit 1
fi

# Exits if project file does not exists
PBXPROJ_FILE="${project_path}/project.pbxproj"
if [ ! -f $PBXPROJ_FILE ]; then
    echo "[ERROR] Project file not found: ${project_path}"
    exit 1
fi

# Info statements
echo "[INFO] Path of .xcodeproj file:		${project_path}"
echo "[INFO] New Icon: 		${new_icon_name}"

# Replaces the setting ASSETCATALOG_COMPILER_APPICON_NAME in the .pbxproj file.
echo ""
echo "Replacing..."
sed -i "" "s/\(ASSETCATALOG_COMPILER_APPICON_NAME = \).*\(;\)/\1${new_icon_name}\2/" $PBXPROJ_FILE
echo ""
echo "[SUCCESS] Replace done!"
