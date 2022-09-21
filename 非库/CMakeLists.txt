cmake_minimum_required(VERSION 3.0)
project(HELLOslam)

include_directories(${PROJECT_SOURCE_DIR}/include)
add_executable(sayhellotop ${PROJECT_SOURCE_DIR}/src/hello.cpp ${PROJECT_SOURCE_DIR}/src/useHello.cpp)

add_subdirectory(src out)