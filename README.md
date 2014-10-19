# CSCI362
## Software Engineering Class

Repository for Team Lucky 7s:
- Laura Barber
- Michael Blackburn
- Venessa Johansen-Barrera

Contains student-created test materials for readthedocs.org.

Structured according to Team Project Specifications.

## Brief Description
There is a bash script that will read through provided testCase files and based on the contents of that file cause the driver `test.py` to call the appropriate function with the provided input. It will then compare the output of the test to the oracle specified in the testCase file. 

## To Run
Go to the top level directory (Lucky7_TESTING) and type in `./scripts/runAllTests.sh`. Results will open in browser.

## Each Test Case
Test case txt files will be formatted as follows:
- test number
- requirement 
- method 
- input 
- oracle
    - Note: oracle must be in the format `True` or `False` 

File must be saved in the form `testCase[num].txt`.