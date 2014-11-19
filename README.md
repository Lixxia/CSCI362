# CSCI362
## Software Engineering Class

Repository for Team Lucky 7s:
- Laura Barber
- Michael Blackburn
- Venessa Johansen-Barrera

Contains student-created test materials for readthedocs.org.

Structured according to Team Project Specifications.

## Brief Description
The project is structured such that the bash script `runAllTests.sh` will read through provided testCase files and, based on the contents of that file, call the driver `test.py` to run the appropriate method with the provided input. The script will then compare the output of the test to the oracle specified in the testCase file. 

# Requirements
Python 2.7.6
(Check using python --version)
Ubuntu 14.04
Pip

# Install dependencies 
sudo apt-get install python-pip

*Note:* Given that we are only testing a small portion of the *ReadTheDocs*project, we only need to cover a few of its dependencies. These are automatically managed by installing pip (python package manager) using the above command.

## To Run
Within the top level directory (Lucky7_TESTING) typing in `./scripts/runAllTests.sh` will run the test script. Results will open in the default browser.



# Test Case Formatting
- Each testCase file must follow a specific format
- **Naming:**
    + The name of the file must be testCase followed by a number
    + If the number is a single digit `[0-9]` it must be prepended with a 0
        * Example: 1 would become 01. 
    + The extension of the file must be `.txt`
    + Full file example: `testCase01.txt`
- **File Content:** (The format must be as follows, with each part on a single line)
    + test number
    + requirement
    + method name
    + url being tested
    + oracle
        * *NOTE:* the oracle must be in the format "True" or "False" (including the capital letter). There must also be a character turn after this line (hit enter).
- **Example Test file** (*testCase01.txt*)
    + 1
    + url is served by nginx and return 200 OK
    + served_by_nginx
    + https://pip.readthedocs.org/en/latest/
    + True
    + 