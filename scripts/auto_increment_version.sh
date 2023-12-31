#!/bin/bash

# Read the current version
CURRENT_VERSION=$(mvn help:evaluate -Dexpression=project.version -q -DforceStdout)

# Split the version into major, minor, patch
IFS='.' read -ra VER <<< "$CURRENT_VERSION"
MAJOR=${VER[0]}
MINOR=${VER[1]}
PATCH=${VER[2]}

# Increment the patch version
PATCH=$((PATCH+1))

# Construct the new version
NEW_VERSION="$MAJOR.$MINOR.$PATCH"

# Update pom.xml with the new version
mvn versions:set -DnewVersion=$NEW_VERSION
mvn versions:commit

# Output the new version for GitHub Actions
echo "::set-output name=NEW_VERSION::$NEW_VERSION"
