#!/bin/bash

# Create libs directory
mkdir -p libs

# Download NightCore jar
echo "Downloading NightCore..."
curl -L -o libs/nightcore-2.7.15.jar https://github.com/vanes430/nightcore-folia/releases/download/latest/nightcore-2.7.15.jar

# Install to local maven repository so the pom can find it
# This fulfills the requirement of making the pom use this jar
echo "Installing NightCore to local Maven repository..."
mvn install:install-file -Dfile=libs/nightcore-2.7.15.jar -DgroupId=su.nightexpress.nightcore -DartifactId=main -Dversion=2.7.15 -Dpackaging=jar

# Download ExcellentCrates jar
echo "Downloading ExcellentCrates..."
curl -L -o libs/ExcellentCrates-6.3.3.jar https://github.com/vanes430/ExcellentCrates-folia/releases/download/latest/ExcellentCrates-6.3.3.jar

# Install ExcellentCrates to local Maven repository
echo "Installing ExcellentCrates to local Maven repository..."
mvn install:install-file -Dfile=libs/ExcellentCrates-6.3.3.jar -DgroupId=su.nightexpress.excellentcrates -DartifactId=ExcellentCrates -Dversion=6.3.3 -Dpackaging=jar

# Download CoinsEngine jar
echo "Downloading CoinsEngine..."
curl -L -o libs/CoinsEngine-2.5.0.jar https://github.com/vanes430/CoinsEngine-folia/releases/download/latest/CoinsEngine-2.5.0.jar

# Install CoinsEngine to local Maven repository
echo "Installing CoinsEngine to local Maven repository..."
mvn install:install-file -Dfile=libs/CoinsEngine-2.5.0.jar -DgroupId=su.nightexpress.coinsengine -DartifactId=CoinsEngine -Dversion=2.5.0 -Dpackaging=jar

# Build the project
echo "Building project..."
mvn clean
mvn install
