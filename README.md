
# Template for building Atmel START projects with cmake

This build system uses `make` to read variables from Atmel START's generated 
makefile and appropriately add generated files to cmake.  Automatically 
extracts START-produced archive for use during build, and automatically 
re-extracts archive when it's replaced/updated.

## How to use

1. Place your generated project .atzip archive in external/atmel-start
1. Export variable (or edit in Makefile) ATMEL_START_ARCHIVE with name of 
generated project .atzip
1. Probably tweak some other stuff (or even add new toolchain files) since this 
has only been tested on one device so far
1. Run `make` to auto-extract generated project files and build firmware

## Disclaimer

Only used with SAM processor so far; non-M0 platforms need additional work. 
