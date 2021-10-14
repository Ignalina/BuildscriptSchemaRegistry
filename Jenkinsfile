pipeline {
  agent any
  stages {
    stage('build') {
      steps {
        sh '''#bash ./build.sh

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
ls -l 
git clone -b 6.2.1-post  --depth 1  https://github.com/confluentinc/schema-registry.git

pushd kafka
./gradlew jar
./gradlewAll publishToMavenLocal
popd


pushd common
mvn clean install  -Dmaven.test.skip=true 
popd

pushd rest-utils
mvn clean install  -Dmaven.test.skip=true 
popd

pushd schema-registry
mvn clean install  -Dmaven.test.skip=true 
popd'''
      }
    }

  }
}