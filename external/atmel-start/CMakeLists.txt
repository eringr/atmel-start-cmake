
set(dir_includes ${ATMEL_DIRS})
separate_arguments(dir_includes)
list(TRANSFORM dir_includes REPLACE "-I\.\./(.+)" "\\1")
list(FILTER dir_includes EXCLUDE REGEX "-I\.\./")
list(TRANSFORM dir_includes PREPEND "$ENV{GENERATED_DIR}/")
list(APPEND dir_includes "$ENV{GENERATED_DIR}")

target_include_directories(${PROJECT_NAME} PRIVATE ${dir_includes})

set(sources ${ATMEL_OBJS})
separate_arguments(sources)
list(REMOVE_ITEM sources "main.o")
list(TRANSFORM sources REPLACE "\\.o" ".c")
list(TRANSFORM sources PREPEND $ENV{GENERATED_DIR}/)

target_sources(firmware PRIVATE ${sources})

target_link_options(${PROJECT_NAME} PRIVATE
    -T${CMAKE_SOURCE_DIR}/$ENV{ATMEL_START_UNZIP}/gcc/gcc/${PARTNO_LOWER}_flash.ld
    -L${CMAKE_SOURCE_DIR}/$ENV{ATMEL_START_UNZIP}/gcc/gcc
)

target_compile_definitions(${PROJECT_NAME} PRIVATE
    ${DEVICE_DEF}
)
