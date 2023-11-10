cmake_minimum_required(VERSION 3.11)

project(pipioc)

enable_language(OBJCXX)

set(CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake;${CMAKE_MODULE_PATH}")

add_subdirectory(${PROJECT_SOURCE_DIR}/src/pipioc)
add_subdirectory(${PROJECT_SOURCE_DIR}/src/main)