# ---- nginx_smoke_test.py ----
import sys
sys.path.append('/home/michaelblackburn/rtd/checkouts/readthedocs.org/deploy/')

tmp = __import__('nginx-smoke-test')
globals().update(vars(tmp))

# ---- main.py ----
#from nginx_smoke_test import *
