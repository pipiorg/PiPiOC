file(GLOB PIPI_OC_MAIN_HEADER_FILES "*.h")
file(GLOB PIPI_OC_MAIN_SOURCE_FILES "*.m")

add_executable(
    pipiocmain
    ${PIPI_OC_MAIN_HEADER_FILES}
    ${PIPI_OC_MAIN_SOURCE_FILES}
)

target_link_libraries(pipiocmain pipioc::pipioc)
target_include_directories(pipioc PUBLIC ${PROJECT_SOURCE_DIR}/src/pipioc)