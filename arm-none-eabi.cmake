set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR arm)

set(CMAKE_TRY_COMPILE_TARGET_TYPE   STATIC_LIBRARY)

set(CMAKE_AR                        "arm-none-eabi-ar")
set(CMAKE_ASM_COMPILER              "arm-none-eabi-gcc")
set(CMAKE_C_COMPILER                "arm-none-eabi-gcc")
set(CMAKE_CXX_COMPILER              "arm-none-eabi-g++")
set(CMAKE_LINKER                    "arm-none-eabi-ld")
set(CMAKE_OBJCOPY                   "arm-none-eabi-objcopy" CACHE INTERNAL "")
set(CMAKE_RANLIB                    "arm-none-eabi-ranlib" CACHE INTERNAL "")
set(CMAKE_SIZE                      "arm-none-eabi-size" CACHE INTERNAL "")
set(CMAKE_STRIP                     "arm-none-eabi-strip" CACHE INTERNAL "")

set(CMAKE_C_COMPILER "arm-none-eabi-gcc")
set(CMAKE_CXX_COMPILER "arm-none-eabi-g++")

set(CMAKE_C_FLAGS
    "-mthumb -Os -ffunction-sections -mlong-calls -g3 -Wall --specs=nano.specs\
    -mcpu=${MCPU} -std=gnu99"
)

set(CMAKE_EXE_LINKER_FLAGS
    "-Wl,--start-group,-lm,--end-group,--gc-sections,-Map=\"firmware.map\""
)

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
