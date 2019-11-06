#!/bin/bash

set -xe

WORKDIR="$PWD/j2v8"
ARTIFACT_VERSION="7.0.1-v8_7.4.288-conversocial"

brew install cmake
brew install maven

mkdir -p $HOME/.local
cd $HOME/.local
git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git

export PATH=$PATH:$HOME/.local/depot_tools

python --version
java -version
mvn --version

cd $WORKDIR
pwd
git clone https://github.com/eclipsesource/J2V8 --branch v8-7.4.288-build .

mkdir -p v8build
cd v8build

fetch v8 
echo "target_os= ['macosx']">>.gclient 
gclient sync 

cd v8 
git checkout 7.4.288 
./tools/dev/v8gen.py x64.release -vv 

cat <<EOF >> out.gn/x64.release/args.gn
is_component_build = false
is_debug = false
use_custom_libcxx = false
v8_monolithic = true
v8_use_external_startup_data = false
symbol_level = 0
v8_enable_i18n_support= false
EOF

touch out.gn/x64.release/args.gn 
ls -al out.gn/x64.release/ 

ninja -C out.gn/x64.release -t clean 
ninja -C out.gn/x64.release v8_monolith 

mkdir -p ${WORKDIR}/v8.out/macos.x64 
cp out.gn/x64.release/obj/libv8_monolith.a $WORKDIR/v8.out/macos.x64 

cd $WORKDIR 
cp -R v8build/v8/include v8.out/ 
python build.py -t macos -a x64 j2v8cmake j2v8jni j2v8cpp j2v8optimize j2v8java j2v8test

mkdir -p /srv/artifacts
cp -v target/j2v8_*.jar /srv/artifacts/j2v8_$ARTIFACT_VERSION.jar
