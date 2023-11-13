file(GLOB PIPI_OC_MAIN_HEADER_FILES "*.h")
file(GLOB PIPI_OC_MAIN_SOURCE_FILES "*.mm")

add_executable(
    pipiocmain
    ${PIPI_OC_MAIN_HEADER_FILES}
    ${PIPI_OC_MAIN_SOURCE_FILES}
)

set_target_properties(pipiocmain PROPERTIES
    XCODE_ATTRIBUTE_CLANG_CXX_LANGUAGE_STANDARD "gnu++17"
)

target_link_libraries(pipiocmain pipioc::pipioc)
target_include_directories(pipioc PUBLIC ${PROJECT_SOURCE_DIR}/src/pipioc)