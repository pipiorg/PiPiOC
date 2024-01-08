#!/bin/bash
pushd `dirname $0`
pushd ..

rm -rf build
rm -rf ext
rm -rf ext-build

mkdir build

cd build

cmake -G "Xcode" \
    -DCMAKE_FIND_FRAMEWORK=NEVER \
    -DCMAKE_PREFIX_PATH=`brew --prefix` \
    -DFontconfig_INCLUDE_DIR=`brew --prefix fontconfig`/include \
    -DOPENSSL_ROOT_DIR=`brew --prefix openssl@3` ..

popd
popd