#! /bin/bash

# Simple test script that runs two programs against the same test cases provided through 
# standard in. It assumes the second program is the provided solution. The script compares 
# exit statues for both programs before comparing the standard output via diff. If either
# comparison fails, the test is assumed to have failed. 

# Usage: 
# check.bash <test program> <provided solution> <directory of test files>

# Written by Brayden Streeter

if [ "$#" -ne 3 ] ; then
	echo -e "Invalid arguments passed. \n\nUsage: \n\t$0 <your code> <solution> <test directory>\n"
	echo -e "The test directory should contain all of the different inputs you want to test against. 
Both your application and the solution will be ran against the inputs. The exit codes 
will be compared, and the outputs will be tested with diff.\n"
	exit 1
fi

# Set variables
USER=$1
SOLUTION=$2
TEST_DIR=$3

if [ ! -d $TEST_DIR ] ; then
	echo "\n\t$TEST_DIR is not an accessible directory. Please verify the path.\n"
	exit 1
fi

echo -e "\nProgram to test    :\t$USER"
echo -e "Solution           :\t$SOLUTION"
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
rm -f $TEST_DIR/*.expected

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
TESTS=$(ls ${TEST_DIR}/)

# Break the string into an array
set $TESTS

# Run the tests
for FILENAME in $TESTS ; do
	echo -e "\nStarting testcase: $FILENAME"

	FILE="$TEST_DIR$FILENAME"
	(( TOTAL_COUNT += 1 ))

	# Run the solution
	$SOLUTION < $FILE > $FILE.expected
	EXP_EXIT=$?

	# Run users code
	$USER < $FILE > $FILE.out
	USER_EXIT=$?

	# Check exit codes
	if [ $USER_EXIT != $EXP_EXIT ] ; then 
		echo -e "${RED}$FILENAME failed.${NONE}\n\tExpected $EXP_EXIT, instead returned $USER_EXIT"
		FAILED=1

	# Compare output
	else 
		echo -e "\tdiff -q $FILE.expected $FILE.out"
		diff -q $FILE.expected $FILE.out 

		# Files differed, show output
		if [ $? -ne 0 ] ; then
			echo -e "${RED}$FILENAME failed.${NONE}\n\tOutput from diff:"
			diff -C1 $FILE.expected $FILE.out
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