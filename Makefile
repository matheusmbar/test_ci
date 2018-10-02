
# This is the test makefile for Brrancoraptor Lino v1 firmware
#
# It works based on CppUTest


## we don't want to use relative paths, so we set these variables
TEMP_DIR=$(dir $(realpath $(firstword $(MAKEFILE_LIST))))

# ## Define project directory path
REPOSITORY_DIR=$(realpath $(TEMP_DIR)..)/test_ci

MAKEFILE_DIR = $(REPOSITORY_DIR)


PROJECT_DIR=$(MAKEFILE_DIR)
SRC_DIRS=$(PROJECT_DIR)/src
INCLUDE_DIRS+=$(PROJECT_DIR)/inc

## test folder directory
TEST_DIR=$(MAKEFILE_DIR)


# add this to avoid problems when including cpputest headers on test files
INCLUDE_DIRS+=$(TEST_DIR)/cpputest/include


# ----------------------- CppUTest configs -------------------------------------

## specify where the test code is located
TEST_SRC_DIRS=$(TEST_DIR)

## what to call the test binary
TEST_TARGET=test_runner.o

## specify where the object and lib files will go
CPPUTEST_OBJS_DIR=$(TEST_DIR)/test_build/objs
CPPUTEST_LIB_DIR=$(TEST_DIR)/test_build/lib

#where the cpputest library is located
CPPUTEST_HOME=$(TEST_DIR)/cpputest

# ## define component name
COMPONENT_NAME = tester

# ------------------------ Compiler configs ------------------------------------
# ## enable code coverage check
CPPUTEST_USE_GCOV=Y

# ## disable pedantic errors
CPPUTEST_PEDANTIC_ERRORS=N

# ## enable CppUTest extensions (to use CppUMock)
CPPUTEST_USE_EXTENSIONS=Y

# ## consider sign-conversion error as a WARNING instead of an ERROR
CPPUTEST_CXXFLAGS=-Wno-error=sign-conversion

# ## compile with debug flag to allow use of valgrind tools later
CPPUTEST_CPPFLAGS=-g

# ## select memory leak detection
CPPUTEST_USE_MEM_LEAK_DETECTION=Y

CXXFLAGS += -include $(CPPUTEST_HOME)/include/CppUTest/MemoryLeakDetectorNewMacros.h
CFLAGS += -include $(CPPUTEST_HOME)/include/CppUTest/MemoryLeakDetectorMallocMacros.h

ifndef SILENCE
	SILENCE = @
endif

# ## disable warning about C++ 14 compatibility

CPPUTEST_CXXFLAGS+=-Wno-c++14-compat

ifndef SILENCE
	SILENCE = @
endif

#run MakefileWorker.mk with the variables defined here
include $(CPPUTEST_HOME)/build/MakefileWorker.mk

.PHONY: run
run: start $(TEST_TARGET)
	$(RUN_TEST_TARGET)

.PHONY: check_paths
check_paths:
		@echo "\nRepository dir\t" $(REPOSITORY_DIR)
		@echo "\nTest dir\t" $(TEST_DIR)
		@echo "\nMakefile dir\t" $(MAKEFILE_DIR)
		@echo "\nProject dir\t" $(PROJECT_DIR)
		@echo "\nSrc dir  \t" $(SRC_DIR)
		@echo "\nSrc dirs  \t" $(SRC_DIRS)
		@echo "\nInclude dirs  \t" $(INCLUDE_DIRS)
