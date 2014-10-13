#import sys

#sys.path.append('/home/lixxia/rtd/checkouts/readthedocs.org/deploy/')

from nginx_smoke_test import * #import proxy

def getlist(filename):
	infile = open(filename, 'r')
	mylist = []
	for line in infile:
		mylist.append(line.rstrip())
	infile.close()
	return mylist

def main():

	# nginx tests 1-3
	nginx_list = getlist('nginxTests')
	print("NGINX METHOD TESTS")
	i=0
	for url in nginx_list:
		i+=1
		print("==================")
		print("Test " + str(i))
		print("Test input: " + url)
		print("Expected Outcome: " + str(served_by_nginx(url)))
		print("Actual Outcome: " + str(served_by_nginx(url)))

	#Django tests 4-6
	django_list = getlist('djangoTests')
	print("\nDJANGO METHOD TESTS")
	i=3
	for url in django_list:
		i+=1
		print("==================")
		print("Test " + str(i))
		print("Test input: " + url)
		print("Expected Outcome: " + str(served_by_django(url)))
		print("Actual Outcome: " + str(served_by_django(url)))

main()
