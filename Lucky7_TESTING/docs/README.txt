README.txt
Will contain how-to.
Installation of dependencies.
Running of script

# Test Case Formatting
- Each testCase.txt file must follow a specific format
- Naming:
    + The name of the file must be testCase followed by a number
    + If the number is a single digit [0-9] it must be prepended with a 0
        * Example: 1 would become 01. 
    + The extension of the file must be .txt
    + Full file example: testCase01.txt
- File Content: (The format must be as follows, with each part on a single line)
    + test number
    + requirement
    + method name
    + url being tested
    + oracle
        * NOTE: the oracle must be in the format "True" or "False" (including the capital letter). There must also be a character turn after this line (hit enter).
- Example Test file (testCase01.txt)
    + 1
    + url is served by nginx and return 200 OK
    + served_by_nginx
    + https://pip.readthedocs.org/en/latest/
    + True
    + 
- 