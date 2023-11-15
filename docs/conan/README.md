# How to cross compile required dependency for ios arm64 architecture

Cross compile the required dependency for ios arm64 architecture with [conan v1](https://conan.io/).

## Preparation

1. Clone project

    ```bash
    git clone https://github.com/nativium/nativium.git
    ```

2. Move into working directory

    ```bash
    cd conan/darwin-toolchain
    ```

3. Build

    ```bash
    conan create . nativium/stable
    ```

## Build

1. Install conan

    ```bash
    brew install conan@v1
    ```

2. Create build director

    ```bash
    mkdir build
    cd build
    ```

3. Run install

    ```bash
    conan install .. -pr:h=../ios_profile -pr:b=default --build=missing

    # The generated dependency under "./bin" directory 
    ```
