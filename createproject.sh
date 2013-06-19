#!/bin/sh
if [ -z "$1" ]; then
	echo "Specify Project Directory name."
	exit 1
fi
export artifactId=$1
export groupId=com.monojohnny
export version=1.0-SNAPSHOT
export archetypeArtifactId=maven-archetype-quickstart

mvn -B archetype:generate \
  -DarchetypeGroupId=org.apache.maven.archetypes \
  -DgroupId=$groupId \
  -DartifactId=$artifactId \
  -Dversion=$version \
  -DarchetypeArtifactId=$archetypeArtifactId

if [ $? -ne 0 ] ; then
	exit $?
fi

cd $artifactId
echo target > .gitignore
git init 
git add pom.xml
git add src
git add .gitignore
git commit -m "Initial Commit"
cd ..
