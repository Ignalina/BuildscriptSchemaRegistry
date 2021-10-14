#!/bin/bash

#
#
# Dependencies: bash , mvn

git clone -b 6.2.1-post  --depth 1  https://github.com/confluentinc/kafka.git
git clone -b 6.2.1-post  --depth 1  https://github.com/confluentinc/common.git
git clone -b 6.2.1-post  --depth 1  https://github.com/confluentinc/rest-util.git
git clone -b 6.2.1-post  --depth 1  https://github.com/confluentinc/schema-registry.git

pushd kafka
popd


pushd common
mvn clean install  -Dmaven.test.skip=true 
popd

pushd rest-util
mvn clean install  -Dmaven.test.skip=true 
popd

pushd schema-registry
mvn clean install  -Dmaven.test.skip=true 
popd



