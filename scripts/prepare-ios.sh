#!/bin/bash
pushd `dirname $0`
pushd ..

root=$(pwd)

rm -rf build
rm -rf ext
rm -rf ext-build

mkdir build

pushd build

cmake -G "Xcode" \
    -DCMAKE_FIND_FRAMEWORK=NEVER \
    -DCMAKE_TOOLCHAIN_FILE=../cmake/ios.toolchain.cmake \
    -DPLATFORM=OS64 \
    -DDEPLOYMENT_TARGET=13.1 \
    -DOPENSSL_ROOT_DIR="$root/3rdparty/ios/openssl" \
    -DTIFF_LIBRARY="$root/3rdparty/ios/libtiff/libtiff.a" \
    -DTIFF_INCLUDE_DIR="$root/3rdparty/ios/libtiff/include" \
    -DPNG_LIBRARY="$root/3rdparty/ios/libpng/libpng.a" \
    -DPNG_PNG_INCLUDE_DIR="$root/3rdparty/ios/libpng/include" \
    -DJPEG_LIBRARY="$root/3rdparty/ios/libjpeg/libjpeg.a" \
    -DJPEG_INCLUDE_DIR="$root/3rdparty/ios/libjpeg/include" \
    -DFREETYPE_LIBRARY="$root/3rdparty/ios/freetype/libfreetype.a" \
    -DFREETYPE_INCLUDE_DIRS="$root/3rdparty/ios/freetype/include" \
    -DFontconfig_LIBRARY="$root/3rdparty/ios/fontconfig/libfontconfig.a" \
    -DFontconfig_INCLUDE_DIR="$root/3rdparty/ios/fontconfig/include" \
    -DBROTLICOMMON_LIBRARY="$root/3rdparty/ios/libbrotlicommon.a" \
    -DBROTLIDEC_LIBRARY="$root/3rdparty/ios/libbrotlidec.a" \
    -DBROTLIENC_LIBRARY="$root/3rdparty/ios/libbrotlienc.a" \
    -DBZ2_LIBRARY="$root/3rdparty/ios/libbz2.a" \
    -DCHARSET_LIBRARY="$root/3rdparty/ios/libcharset.a" \
    -DDEFLATE_LIBRARY="$root/3rdparty/ios/libdeflate.a" \
    -DEXPAT_LIBRARY="$root/3rdparty/ios/libexpat.a" \
    -DICONV_LIBRARY="$root/3rdparty/ios/libiconv.a" \
    -DJBIG_LIBRARY="$root/3rdparty/ios/libjbig.a" \
    -DLZMA_LIBRARY="$root/3rdparty/ios/liblzma.a" \
    -DSHARPYUV_LIBRARY="$root/3rdparty/ios/libsharpyuv.a" \
    -DTIFFXX_LIBRARY="$root/3rdparty/ios/libtiffxx.a" \
    -DWEBP_LIBRARY="$root/3rdparty/ios/libwebp.a" \
    -DWEBPDECODER_LIBRARY="$root/3rdparty/ios/libwebpdecoder.a" \
    -DWEBPDEMUX_LIBRARY="$root/3rdparty/ios/libwebpdemux.a" \
    -DWEBPMUX_LIBRARY="$root/3rdparty/ios/libwebpmux.a" \
    -DXML2_LIBRARY="$root/3rdparty/ios/libxml2.a" \
    -DZ_LIBRARY="$root/3rdparty/ios/libz.a" \
    -DZSTD_LIBRARY="$root/3rdparty/ios/libzstd.a" ..

popd
popd
popd