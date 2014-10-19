import nginx_smoke_test #import proxy
import sys

def runMethod(method,url):
	print(getattr(nginx_smoke_test, method)(url))


if __name__ == '__main__':
	runMethod(*sys.argv[1:])

