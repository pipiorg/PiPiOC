# PiPiOC

## Requirement

- C++ 17+
- cmake 3.11+

## Project

```bash
# Create xcode directory
mkdir xcode
cd xcode

# Generate project
cmake -G "Xcode" -DCMAKE_FIND_FRAMEWORK=NEVER -DCMAKE_PREFIX_PATH=`brew --prefix` -DFontconfig_INCLUDE_DIR=`brew --prefix fontconfig`/include -DOPENSSL_ROOT_DIR=`brew --prefix openssl@3` ..
```

## Build

```bash
# Install dependency with homebrew
brew install fontconfig freetype openssl libxml2 jpeg-turbo libpng libtiff libidn

# Create build directory
mkdir build
cd build

# Create make
cmake -DCMAKE_FIND_FRAMEWORK=NEVER -DCMAKE_PREFIX_PATH=`brew --prefix` -DFontconfig_INCLUDE_DIR=`brew --prefix fontconfig`/include -DOPENSSL_ROOT_DIR=`brew --prefix openssl@3` -DCMAKE_TOOLCHAIN_FILE=../cmake/ios.toolchain.cmake -DPLATFORM=OS64 -DDEPLOYMENT_TARGET=13.1 ..

# Build pipioc
cmake --build . --target pipioc
```
