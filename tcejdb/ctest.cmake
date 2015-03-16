# Source directory: /home/adam/Projects/softmotions/ejdb/tcejdb
# Build directory: /home/adam/Projects/softmotions/ejdb/tcejdb

set(CTEST_SOURCE_DIRECTORY /home/adam/Projects/softmotions/ejdb/tcejdb)
set(CTEST_BINARY_DIRECTORY /home/adam/Projects/softmotions/ejdb/tcejdb/build)

set(CTEST_START_WITH_EMPTY_BINARY_DIRECTORY TRUE)
set(CTEST_CMAKE_GENERATOR "Unix Makefiles")
set(CTEST_BUILD_CONFIGURATION "Debug")
set(CTEST_BUILD_OPTIONS)

set(CTEST_CONFIGURE_COMMAND "${CMAKE_COMMAND} -DCMAKE_BUILD_TYPE:STRING=${CTEST_BUILD_CONFIGURATION}")
set(CTEST_CONFIGURE_COMMAND "${CTEST_CONFIGURE_COMMAND} -DWITH_TESTS:BOOL=ON ${CTEST_BUILD_OPTIONS}")
set(CTEST_CONFIGURE_COMMAND "${CTEST_CONFIGURE_COMMAND} \"-G${CTEST_CMAKE_GENERATOR}\"")
set(CTEST_CONFIGURE_COMMAND "${CTEST_CONFIGURE_COMMAND} \"${CTEST_SOURCE_DIRECTORY}\"")

find_program(CTEST_COVERAGE_COMMAND NAMES gcov)
find_program(CTEST_MEMORYCHECK_COMMAND NAMES valgrind)

ctest_empty_binary_directory(${CTEST_BINARY_DIRECTORY})

ctest_start("Nightly")
#ctest_update()
ctest_configure()
ctest_build()
ctest_test()

if (WITH_COVERAGE AND CTEST_COVERAGE_COMMAND)
  ctest_coverage()
endif (WITH_COVERAGE AND CTEST_COVERAGE_COMMAND)
if (WITH_MEMCHECK AND CTEST_MEMORYCHECK_COMMAND)
  ctest_memcheck()
endif (WITH_MEMCHECK AND CTEST_MEMORYCHECK_COMMAND)

#ctest_submit()

