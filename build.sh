#!/bin/bash

#
#
# Dependencies: bash , mvn

: git clone -b 6.2.1-post  --depth 1  https://github.com/confluentinc/kafka.git
: git clone -b 6.2.1-post  --depth 1  https://github.com/confluentinc/common.git
: git clone -b 6.2.1-post  --depth 1  https://github.com/confluentinc/rest-utils.git
: git clone -b 6.2.1-post  --depth 1  https://github.com/confluentinc/schema-registry.git

cd kafka
./gradlew jar
./gradlewAll install
cd ..

cd common
mvn install  -Dmaven.test.skip=true 
cd ..

cd rest-utils
mvn install  -Dmaven.test.skip=true 
cd ..

cd schema-registry
mvn install  -Dmaven.test.skip=true 
cd ..

tar -zcf schema-registry.tar.gz schema-registry
jfrog rt cp schema-registry.tar.gz ignalina/miscc
