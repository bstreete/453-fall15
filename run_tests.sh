#! /bin/bash

# Usage: 
# check.bash <test program> <directory of test files>

# Written by Brayden Streeter

if [ "$#" -ne 2 ] ; then
	cat <<- _EOF_
Invalid arguments passed. 

Usage: 
 	$0 <your code> <test directory>

The test directory should contain all of the different inputs you want 
to test against. Your application will be ran against the inputs. The 
exit codes will be compared, and the outputs will be tested with diff.
_EOF_
	exit 1
fi

# Set variables
USER=$1
TEST_DIR=$2

if [ ! -d $TEST_DIR ] ; then
	echo "\n\t$TEST_DIR is not an accessible directory. Please verify the path.\n"
	exit 1
fi

echo -e "\nProgram to test    :\t$USER"
echo -e "Testfile Directory :\t$TEST_DIR\n"

# Color Codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
NONE='\033[0m'

# Initialize counters and failed test names 
TOTAL_COUNT=0
PASS_COUNT=0
FAIL_COUNT=0
FAILED_TESTS=""
FAILED=0

echo "Cleaning old test files...."
rm -f $TEST_DIR/*.out

echo "Recompiling $USER...."

# Recompile and check for warnings
make clean > /dev/null
make > /dev/null

if [ $? -ne 0 ] ; then
	echo -e "\n${RED}$USER failed compilation.${NONE}"
	exit 1
fi

echo -e "\n---------------------\n     Start Tests\n---------------------"
# Get a list of test files from the directory
TESTS=$(ls -v ${TEST_DIR}/)

# Break the string into an array
set $TESTS

# Run the tests
for FILENAME in $TESTS ; do
	echo -e "\nStarting testcase: $FILENAME"

	FILE="$TEST_DIR$FILENAME"
	(( TOTAL_COUNT += 1 ))

	# Run users code
	$USER < $FILE > $FILE.out
	USER_EXIT=$?

	# Read the first line to get return status
	EXP_EXIT=$(head -n1 $FILE)
	EXP_EXIT=${EXP_EXIT:3:1}

	# Check exit codes
	if [ $USER_EXIT -ne $EXP_EXIT ] ; then 
		echo -e "${RED}$FILENAME failed.${NONE}\n\tExpected $EXP_EXIT, instead returned $USER_EXIT"
		FAILED=1

	# Check output
	else 
		
		# Files differed, show output
		if [ -s $FILE.out ] ; then
			echo -e "${RED}$FILENAME failed.${NONE}\n\tOutput:"
			head $FILE.out
			FAILED=1
		fi
	fi

	# Update counters
	if [ $FAILED  -ne 0 ] ; then
		(( FAIL_COUNT += 1 ))
		FAILED_TESTS="${FAILED_TESTS}\n\t${FILENAME}" 
	else
		echo -e "${GREEN}$FILENAME passed.${NONE}"
		(( PASS_COUNT += 1 ))
	fi

	# Reset the failed flag
	FAILED=0
done

echo -e "\n----------------------\n     End of Tests\n----------------------"

# All tests passed
if [ $FAIL_COUNT -eq 0 ] ; then
	echo -e "\nAll $TOTAL_COUNT tests passed."

# Otherwise, print failed tests
else
	echo -e "\n${RED}Failed $FAIL_COUNT of $TOTAL_COUNT tests. ${NONE}\n${FAILED_TESTS}"
fi