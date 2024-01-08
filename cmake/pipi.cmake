include(FetchContent)

set(PIPI_GIT_TAG	main)
set(PIPI_GIT_URL	https://github.com/pipiorg/PiPi.git)
set(PIPI_SOURCE_DIR	${CMAKE_SOURCE_DIR}/ext/pipi)
set(PIPI_BINARY_DIR	${CMAKE_SOURCE_DIR}/ext-build/pipi)

FetchContent_Declare(
	pipi
	GIT_REPOSITORY	${PIPI_GIT_URL}
	GIT_TAG			${PIPI_GIT_TAG}
	SOURCE_DIR		${PIPI_SOURCE_DIR}
	BINARY_DIR		${PIPI_BINARY_DIR}
)

FetchContent_MakeAvailable(pipi)

if (DEFINED PLATFORM) 
    if ("${PLATFORM}" STREQUAL "OS64")
		target_link_options(podofo_shared PUBLIC ${BROTLICOMMON_LIBRARY})
		target_link_options(podofo_shared PUBLIC ${BROTLIDEC_LIBRARY})
		target_link_options(podofo_shared PUBLIC ${BROTLIENC_LIBRARY})
		target_link_options(podofo_shared PUBLIC ${BZ2_LIBRARY})
		target_link_options(podofo_shared PUBLIC ${CHARSET_LIBRARY})
		target_link_options(podofo_shared PUBLIC ${DEFLATE_LIBRARY})
		target_link_options(podofo_shared PUBLIC ${EXPAT_LIBRARY})
		target_link_options(podofo_shared PUBLIC ${ICONV_LIBRARY})
		target_link_options(podofo_shared PUBLIC ${JBIG_LIBRARY})
		target_link_options(podofo_shared PUBLIC ${LZMA_LIBRARY})
		target_link_options(podofo_shared PUBLIC ${SHARPYUV_LIBRARY})
		target_link_options(podofo_shared PUBLIC ${TIFFXX_LIBRARY})
		target_link_options(podofo_shared PUBLIC ${WEBP_LIBRARY})
		target_link_options(podofo_shared PUBLIC ${WEBPDECODER_LIBRARY})
		target_link_options(podofo_shared PUBLIC ${WEBPDEMUX_LIBRARY})
		target_link_options(podofo_shared PUBLIC ${WEBPMUX_LIBRARY})
		target_link_options(podofo_shared PUBLIC ${XML2_LIBRARY})
		target_link_options(podofo_shared PUBLIC ${Z_LIBRARY})
		target_link_options(podofo_shared PUBLIC ${ZSTD_LIBRARY})

		set_property (TARGET podofo_shared PROPERTY XCODE_ATTRIBUTE_DEVELOPMENT_TEAM "")
		set_property (TARGET podofo_shared PROPERTY XCODE_ATTRIBUTE_CODE_SIGN_IDENTITY "")
		set_property (TARGET podofo_shared PROPERTY XCODE_ATTRIBUTE_CODE_SIGN_STYLE Manual)
		set_property (TARGET podofo_shared PROPERTY XCODE_ATTRIBUTE_CODE_SIGNING_ALLOWED "NO")
		
		set_property (TARGET pipi PROPERTY XCODE_ATTRIBUTE_DEVELOPMENT_TEAM "")
		set_property (TARGET pipi PROPERTY XCODE_ATTRIBUTE_CODE_SIGN_IDENTITY "")
		set_property (TARGET pipi PROPERTY XCODE_ATTRIBUTE_CODE_SIGN_STYLE Manual)
		set_property (TARGET pipi PROPERTY XCODE_ATTRIBUTE_CODE_SIGNING_ALLOWED "NO")
    endif()
endif()