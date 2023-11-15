# PiPiOC

## Requirement

- C++ 17+
- cmake 3.11+

## Build

- Run on MacOSX

    ```bash
    # Install dependency with homebrew
    brew install fontconfig freetype openssl libxml2 jpeg-turbo libpng libtiff libidn

    # Create xcode directory
    mkdir xcode
    cd xcode

    # Generate project
    cmake -G "Xcode" -DCMAKE_FIND_FRAMEWORK=NEVER -DCMAKE_PREFIX_PATH=`brew --prefix` -DFontconfig_INCLUDE_DIR=`brew --prefix fontconfig`/include -DOPENSSL_ROOT_DIR=`brew --prefix openssl@3` ..
    ```

- Run on iOS

    ```bash
    # Create build directory
    mkdir build
    cd build

    # Create make
    # Please replace the dependency under 3rdparty directory
    cmake -G "Xcode" \
        -DCMAKE_FIND_FRAMEWORK=NEVER \
        -DOPENSSL_ROOT_DIR="" \
        -DTIFF_LIBRARY="" \
        -DTIFF_INCLUDE_DIR="" \
        -DPNG_LIBRARY="" \
        -DPNG_PNG_INCLUDE_DIR="" \
        -DLIBIDN_INCLUDE_DIR="" \
        -DLIBIDN_LIBRARY="" \
        -DFREETYPE_LIBRARY="" \
        -DFREETYPE_INCLUDE_DIRS="" \
        -DFontconfig_LIBRARY="" \
        -DFontconfig_INCLUDE_DIR="" \
        -DOPENSSL_ROOT_DIR="" \
        -DJPEG_LIBRARY="" \
        -DJPEG_INCLUDE_DIR="" \
        -DCMAKE_TOOLCHAIN_FILE=../cmake/ios.toolchain.cmake \
        -DPLATFORM=OS64 \
        -DDEPLOYMENT_TARGET=13.1 ..

    # Build pipioc
    cmake --build . --config Release --target pipioc
    ```
