# PiPiOC

## Requirement

- C++ 17+
- cmake 3.11+

## Build

- Run on MacOSX

    ```bash
    # Install dependency with homebrew
    brew install fontconfig freetype openssl libxml2 jpeg-turbo libpng libtiff libidn

    # Run prepare script
    ./scripts/prepare-macosx.sh
    ```

- Run on iOS

    ```bash
    # Run prepare script
    ./scripts/prepare-ios.sh

    # Run build script
    ./scripts/build-ios.sh

    # The compiled framework under
    # ./build/src/pipioc/Release-iphoneos
    # The compiled dependency under
    # ./build/lib/Release
    ```
