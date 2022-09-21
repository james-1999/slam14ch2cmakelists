message("-----正在执行FindHELLO.cmake文件----")

find_path(HELLO_INCLUDE_DIR hello.h /usr/local)  #在/usr/local的范围内搜索
find_library(HELLO_LIBRARY hello /usr/local)
message(STATUS ${HELLO_INCLUDE_DIR})

if(HELLO_INCLUDE_DIR AND HELLO_LIBRARY)
    set(HELLO_FOUND TRUE)
endif(HELLO_INCLUDE_DIR AND HELLO_LIBRARY)

if(HELLO_FOUND)
    if(NOT HELLO_FIND_QUIETLY) #HELLO_FIND_QUIETLY 是系统隐式帮我们定义的变量，上层find_package(<name> QUIET)的时候定义为true
        message(STATUS "FOUND_HELLO" ${HELLO_LIBRARY} )
    endif(NOT HELLO_FIND_QUIETLY)
else(NOT HELLO_FOUND)
    if(HELLO_FIND_REQUIRED)
        message(STATUS "could not find hello library")
    endif(HELLO_FIND_REQUIRED)
endif(HELLO_FOUND)

message("-----FindHELLO.cmake文件执行完毕----")