# Using this to avoid import syntax errors caused by '-' in the name.
import sys
sys.path.append('../project/src/')

tmp = __import__('nginx-smoke-test')
globals().update(vars(tmp))

