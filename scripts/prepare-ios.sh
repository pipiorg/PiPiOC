#!/bin/bash
pushd `dirname $0`
pushd ..

rm -rf build
rm -rf ext
rm -rf ext-build

mkdir build

root=$(pwd)

pushd build

cmake -G "Xcode" \
    -DCMAKE_FIND_FRAMEWORK=NEVER \
    -DCMAKE_TOOLCHAIN_FILE=../cmake/ios.toolchain.cmake \
    -DPLATFORM=OS64 \
    -DDEPLOYMENT_TARGET=13.1 \
    -DOPENSSL_ROOT_DIR="$root/3rdparty/openssl" \
    -DTIFF_LIBRARY="$root/3rdparty/libtiff/libtiff.a" \
    -DTIFF_INCLUDE_DIR="$root/3rdparty/libtiff/include" \
    -DPNG_LIBRARY="$root/3rdparty/libpng/libpng.a" \
    -DPNG_PNG_INCLUDE_DIR="$root/3rdparty/libpng/include" \
    -DJPEG_LIBRARY="$root/3rdparty/libjpeg/libjpeg.a" \
    -DJPEG_INCLUDE_DIR="$root/3rdparty/libjpeg/include" \
    -DFREETYPE_LIBRARY="$root/3rdparty/freetype/libfreetype.a" \
    -DFREETYPE_INCLUDE_DIRS="$root/3rdparty/freetype/include" \
    -DFontconfig_LIBRARY="$root/3rdparty/fontconfig/libfontconfig.a" \
    -DFontconfig_INCLUDE_DIR="$root/3rdparty/fontconfig/include" \
    -DBROTLICOMMON_LIBRARY="$root/3rdparty/libbrotlicommon.a" \
    -DBROTLIDEC_LIBRARY="$root/3rdparty/libbrotlidec.a" \
    -DBROTLIENC_LIBRARY="$root/3rdparty/libbrotlienc.a" \
    -DBZ2_LIBRARY="$root/3rdparty/libbz2.a" \
    -DCHARSET_LIBRARY="$root/3rdparty/libcharset.a" \
    -DDEFLATE_LIBRARY="$root/3rdparty/libdeflate.a" \
    -DEXPAT_LIBRARY="$root/3rdparty/libexpat.a" \
    -DICONV_LIBRARY="$root/3rdparty/libiconv.a" \
    -DJBIG_LIBRARY="$root/3rdparty/libjbig.a" \
    -DLZMA_LIBRARY="$root/3rdparty/liblzma.a" \
    -DSHARPYUV_LIBRARY="$root/3rdparty/libsharpyuv.a" \
    -DTIFFXX_LIBRARY="$root/3rdparty/libtiffxx.a" \
    -DWEBP_LIBRARY="$root/3rdparty/libwebp.a" \
    -DWEBPDECODER_LIBRARY="$root/3rdparty/libwebpdecoder.a" \
    -DWEBPDEMUX_LIBRARY="$root/3rdparty/libwebpdemux.a" \
    -DWEBPMUX_LIBRARY="$root/3rdparty/libwebpmux.a" \
    -DXML2_LIBRARY="$root/3rdparty/libxml2.a" \
    -DZ_LIBRARY="$root/3rdparty/libz.a" \
    -DZSTD_LIBRARY="$root/3rdparty/libzstd.a" ..

popd
popd
popd