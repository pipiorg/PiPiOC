#!/bin/bash
pushd `dirname $0`
pushd ..
pushd build

cmake --build . --config Release --target pipioc

popd
popd
popd