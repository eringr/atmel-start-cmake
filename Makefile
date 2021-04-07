
export

ATMEL_START_ARCHIVE ?= My\ Project.atzip

ATMEL_START_DIR ?= external/atmel-start
BUILD_DIR ?= build
GENERATED_DIR := generated
ATMEL_START_UNZIP := ${ATMEL_START_DIR}/${GENERATED_DIR}
ATMEL_START_MAKEFILE := ${ATMEL_START_UNZIP}/gcc/Makefile
PRINT_FILE := $(abspath ${ATMEL_START_MAKEFILE})

.PHONY: firmware
firmware: build/build.ninja
	cd build && ninja

build/build.ninja: ${ATMEL_START_MAKEFILE}
	mkdir -p build
	cd build && cmake .. -GNinja

${ATMEL_START_MAKEFILE}: ${ATMEL_START_DIR}/${ATMEL_START_ARCHIVE}
	mkdir -p "${ATMEL_START_UNZIP}"
	unzip -o -DD -d "${ATMEL_START_UNZIP}" "$<"

.PHONY: clean
clean:
	rm -rf ${BUILD_DIR}
	rm -rf ${ATMEL_START_UNZIP}
