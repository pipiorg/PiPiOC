include(pipi)

file(GLOB PIPI_OC_HEADER_FILES "*.h")
file(GLOB PIPI_OC_SOURCE_FILES "*.m" "*.mm")

add_library(
    pipioc
    ${PIPI_OC_HEADER_FILES}
    ${PIPI_OC_SOURCE_FILES}
)

add_library(pipioc::pipioc ALIAS pipioc)

set_target_properties(pipioc PROPERTIES
    FRAMEWORK TRUE
    FRAMEWORK_VERSION A
    VERSION 0.0.0
    SOVERSION 0.0.0

    PUBLIC_HEADER "${PIPI_OC_HEADER_FILES}"
    MACOSX_FRAMEWORK_IDENTIFIER com.pipi.pipioc
    XCODE_ATTRIBUTE_CLANG_CXX_LANGUAGE_STANDARD "gnu++17"
)

target_link_libraries(pipioc "-framework Foundation" pipi::pipi)

target_include_directories(pipioc PUBLIC ${PIPI_SOURCE_DIR}/src/pipi)