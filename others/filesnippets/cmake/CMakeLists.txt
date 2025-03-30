# 声明要求的 cmake 最低版本
cmake_minimum_required(VERSION 3.0)
# 声明一个 cmake 工程
project(demo)
# 指定语言标准
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# 编译选项
set(CMAKE_BUILD_TYPE Release)
option(ENABLE_UNIT_TESTS "Enable unit tests" OFF) #! install 时切记关闭单元测试，否则会把gtest也install

# 其他设置选项
# cmake 自带模块路径在 /usr/lib/cmake/
# 设置 cmake 自定义模块脚本路径
list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake)

set(ALL_TARGET_LIBRARIES "")

include(pcl.cmake)

# 编译成一个可执行程序
add_executable(main main.cpp)
target_link_libraries(main ${ALL_TARGET_LIBRARIES})
