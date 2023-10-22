

cmake_minimum_required(VERSION 3.26)

project(sha C ASM)

include(${CMAKE_SOURCE_DIR}/cmake/utils.cmake)

add_executable(sha)
add_sources_and_assemble(sha sha.c sha_driver.c)
