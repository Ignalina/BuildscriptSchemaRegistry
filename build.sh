#!/bin/bash

#
#
# Dependencies: bash , mvn

rm -rf kafka
rm -rf rest-utils
rm -rf common
rm -rf schema-registry

git clone -b 6.2.1-post  --depth 1  https://github.com/confluentinc/kafka.git
git clone -b 6.2.1-post  --depth 1  https://github.com/confluentinc/common.git
git clone -b 6.2.1-post  --depth 1  https://github.com/confluentinc/rest-utils.git
git clone -b 6.2.1-post  --depth 1  https://github.com/confluentinc/schema-registry.git

cd kafka
./gradlew jar
./gradlewAll publishToMavenLocal
cd ..

cd common
mvn clean install  -Dmaven.test.skip=true 
cd ..

cd rest-utils
mvn clean install  -Dmaven.test.skip=true 
cd ..

cd schema-registry
mvn clean install  -Dmaven.test.skip=true 
cd ..

