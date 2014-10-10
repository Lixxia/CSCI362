# ---- nginx_smoke_test.py ----
import sys
# Still trying to figure out a way to get a relative path, not having much luck. 
# We can work with the literal path for now, change as needed on the testing computer.
# import os
# print(os.path.abspath('Lucky7_TESTING/project/src/rtd/checkout/readthedocs.org/deploy'))
sys.path.append('/home/lixxia/repos/rtd/checkouts/readthedocs.org/deploy/')

tmp = __import__('nginx-smoke-test')
globals().update(vars(tmp))

# ---- main.py ----
#from nginx_smoke_test import *
