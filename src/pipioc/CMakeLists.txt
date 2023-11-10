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
    PUBLIC_HEADER "${PIPI_OC_HEADER_FILES}"
)

target_link_libraries(pipioc "-framework Foundation" pipi::pipi)

target_include_directories(pipioc PUBLIC ${PIPI_SOURCE_DIR}/src/pipi)