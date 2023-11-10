# PiPiOC

## Requirement

- C++ 17+
- cmake 3.11+

## Build

```bash
# With Homebrew
brew install fontconfig freetype openssl libxml2 jpeg-turbo libpng libtiff libidn
mkdir build
cd build
cmake -G "Xcode" -DCMAKE_FIND_FRAMEWORK=NEVER -DCMAKE_PREFIX_PATH=`brew --prefix` -DFontconfig_INCLUDE_DIR=`brew --prefix fontconfig`/include -DOPENSSL_ROOT_DIR=`brew --prefix openssl@3` ..
```
