cmake_minimum_required(VERSION 3.0)

set(CMAKE_BUILD_TYPE RELAESE)

project(HELLOslam)

message("-------------顶层默认CMAKE_INSTALL_PREFIX " ${CMAKE_INSTALL_PREFIX})
set(CMAKE_INSTALL_PREFIX /usr) # 如果在顶层CMakeLists.txt中定义，那么底层的CMAKE_INSTALL_PREFIX会被覆盖
                            #一个bug是本层CMakeLists.txt生成Makefile生成时，翻译器只认本层的变量，不认子层变量，父层变量会直接覆盖子层
                            #导致build中的Makefile用的CMAKE_INSTALL_PREFIX和build/out中用的CMAKE_INSTALL_PREFIX不一样。导致了make install安装路径不同
                            #原则上 所有程序都应该执行build目录下面的Makefile来编译
                            #build里面的目录层级和add_subdirectory一一对应，Makefile也一一对应
                            #这是Cmake预定义了一堆变量造成的混乱
add_subdirectory(src out)   # 要执行out里面的makefile文件 不然会出现莫名其妙的错误，比如CMAKE_INSTALL_PREFIX
