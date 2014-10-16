# CSCI362
## Software Engineering Class

Repository for Team Lucky 7s:
- Laura Barber
- Michael Blackburn
- Venessa Johansen-Barrera

Contains student-created test materials for readthedocs.org.

Repository structured according to Team Project Specifications. Should be the same as on SVN. 

**Currently this only works if the text files containg the tested urls are in the same directory as test.py. We need to figure out a way to reference it from a path, as it needs to be structured differently.**

## To run
There is a short bash script that will run the test.py file. Go to the top level directory (Lucky7_TESTING) and type in `./scripts/runAllTests.sh`. 

**NOTE**
The proxy file `nginx_smoke_test.py` currently contains a literal path to the rtd file. For now, it must be changed in order for the tests to run sucessfully.

**Each Test Case**
Test case txt files will be formatted as follows:
- test number: 
- requirement: 
- method: 
- input: 
- oracle: 
