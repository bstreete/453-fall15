There are two automated testing scripts provided. comp_output.sh can be used when you have a known good program that can be tested against. It will run the same test cases against both programs and compare the return codes and output. 

The second script, run_tests.sh is for testing without a provided solution. It will read the first line of each input file to determine the expected return code. The return code is expected to be the fourth character on the first line. It assumes that a successful program will not print anything to standard out.

The script expects a makefile. It will clean and then recompile the code. Output from each program will be stored in the testing directory. The solution's output (if any) will be saved as <test name>.expected, and the program that is being tested will save to <test name>.out. These files are automatically removed when the script starts.

The included directories contain test inputs for the various projects. 

#### Usage

`./check.bash <program to test> <solution> <directory containing the test files>`
