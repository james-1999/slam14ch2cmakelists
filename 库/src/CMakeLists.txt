include_directories(${PROJECT_SOURCE_DIR}/include)
set(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/lib)
add_library(hello SHARED ${PROJECT_SOURCE_DIR}/src/hello.cpp)

message("-------------默认CMAKE_INSTALL_PREFIX " ${CMAKE_INSTALL_PREFIX})
set(CMAKE_INSTALL_PREFIX /usr)   # 默认定义CMAKE_INSTALL_PREFIX=/usr/local
# 然而这样的修改对最后install实际并没有影响，最后安装位置还是会在默认位置
#只能通过在命令行cmake -D CMAKE_INSTALL_PREFIX=/usr .. 才能改变安装prefix
# 然而又发现 必须执行add_subdirectory（src bin）中bin里面生成的makefile(而不是build下面的）就能解决上面的问题
message("-------------修改后CMAKE_INSTALL_PREFIX " ${CMAKE_INSTALL_PREFIX})
install(TARGETS hello
        LIBRARY DESTINATION local/lib )
install(FILES ${PROJECT_SOURCE_DIR}/include/hello.h  DESTINATION local/include )

set(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake)
find_package(HELLO REQUIRED)
if(HELLO_FOUND)  
    message("HELLO_FOUND 寻找成功")
    set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/output)
    add_executable(main ${PROJECT_SOURCE_DIR}/src/useHello.cpp)
    link_directories(/usr/local/include)
    target_link_libraries(main /usr/local/lib/libhello.so)
else()
    message("HELLO_FOUND 寻找失败,跳过add_executable()  
    如果是第一次camke 请定位到build/out make install一下库")
endif(HELLO_FOUND)

# aux_source_directory(${PROJECT_SOURCE_DIR}/src SRC_LIST)
# # message(STATUS ${SRC_LIST})
# include_directories(${PROJECT_SOURCE_DIR}/include  )
# set(CMAKE_BUILD_TYPE Release)
# add_executable(sayhello ${SRC_LIST})

