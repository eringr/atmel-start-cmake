
cmake_minimum_required(VERSION 3.13)

set(DEVICE_DEF __SAMD10D13AM__)
set(PARTNO_LOWER samd10d13am)
set(MCPU cortex-m0plus)
set(CMAKE_TOOLCHAIN_FILE arm-none-eabi.cmake)

execute_process(COMMAND
    make --no-print-directory -f ../printer.mk OBJS
OUTPUT_VARIABLE ATMEL_OBJS)

execute_process(COMMAND
    make --no-print-directory -f ../printer.mk DIR_INCLUDES
OUTPUT_VARIABLE ATMEL_DIRS)

project(firmware)

add_executable(firmware)

add_subdirectory(external)
add_subdirectory(src)

add_custom_command(TARGET ${PROJECT_NAME} POST_BUILD
    COMMAND ${CMAKE_OBJCOPY} -Oihex ${PROJECT_NAME} ${PROJECT_NAME}.hex
    COMMAND ${CMAKE_OBJCOPY} -Obinary ${PROJECT_NAME} ${PROJECT_NAME}.bin
    COMMAND ${CMAKE_SIZE} ${PROJECT_NAME}
    COMMENT "Building ${HEX_FILE} \nBuilding ${PROJECT_NAME}.bin")

add_custom_command(TARGET ${PROJECT_NAME} POST_BUILD
    COMMAND ${CMAKE_OBJCOPY} -Oihex ${PROJECT_NAME} ${PROJECT_NAME}.hex
    COMMAND ${CMAKE_OBJCOPY} -Obinary ${PROJECT_NAME} ${PROJECT_NAME}.bin
    COMMENT "Building ${HEX_FILE} \nBuilding ${PROJECT_NAME}.bin")
