#!/bin/bash

set -xe

export PATH=$PATH:/opt/depot_tools:/opt/apache-maven-3.5.0/bin
export JAVA_HOME=/opt/jdk/jdk1.8.0_131

python --version
java -version
mvn --version

cd $WORKDIR
pwd
git clone https://github.com/eclipsesource/J2V8 --branch v8-7.4.288-build .

mkdir -p v8build
cd v8build

fetch v8 
echo "target_os= ['linux']">>.gclient 
gclient sync 

cd v8 
git checkout 7.4.288 
./tools/dev/v8gen.py x64.release -vv 

rm out.gn/x64.release/args.gn 
cp $WORKDIR/v8/linux-x64/args.gn out.gn/x64.release/args.gn 
ls -al out.gn/x64.release/ 
cat out.gn/x64.release/args.gn 
sleep 1m 
touch out.gn/x64.release/args.gn 
ls -al out.gn/x64.release/ 

ninja -C out.gn/x64.release -t clean 
ninja -C out.gn/x64.release v8_monolith 

mkdir -p ${WORKDIR}/v8.out/linux.x64 
cp out.gn/x64.release/obj/libv8_monolith.a $WORKDIR/v8.out/linux.x64 

cd $WORKDIR 
cp -R v8build/v8/include v8.out/ 
python build.py -t linux -a x64 --docker j2v8cmake j2v8jni j2v8cpp j2v8optimize j2v8java j2v8test

mkdir -p /srv/artifacts
cp -v target/j2v8_linux_x86_64-*.jar /srv/artifacts
