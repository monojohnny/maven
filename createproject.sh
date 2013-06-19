#!/bin/sh
if [ -z "$1" ]; then
	echo "Specify Project Directory name."
	exit 1
fi
export artifactId=$1
export groupId=com.monojohnny
export version=1.0-SNAPSHOT
export archetypeArtifactId=maven-archetype-quickstart
export username=monojohnny

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

# Not working (the JSON needs a surrounding single quote, but then I am unable to expand the $variable....)
#export json={"name":\"$artifactId\"}
#curl -u $username  https://api.github.com/user/repos -d $json
#git remote add origin git@github.com:$username/$artifactId".git"
#git push origin master
