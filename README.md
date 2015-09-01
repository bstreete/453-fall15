This is a simple bash script that compares the output and return codes for two programs that read from standard in and write to standard out. It is intended to provide a simple way to test code against a known good solution quickly.

The script expects a makefile. It will clean and then recompile the code. Output from each program will be stored in the testing directory. The solution's output will be saved as <test name>.expected, and the program that is being tested will save to <test name>.out. These files are automatically removed when the script starts.

The included directories contain test inputs for the various projects. 

#### Usage

./check.bash <program to test> <solution> <directory containing the test files> 