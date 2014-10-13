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
	print("<h1>NGINX METHOD TESTS</h1>")
	i=0
	for url in nginx_list:
		i+=1
		print("<hr>")
		print("<br><b>Test " + str(i) +"</b>")
		print("<br><b>Test input:</b> " + url)
		print("<br><b>Expected Outcome:</b> " + str(served_by_nginx(url)))
		print("<br><b>Actual Outcome:</b> " + str(served_by_nginx(url)))

	#Django tests 4-6
	django_list = getlist('djangoTests')
	print("<br><br><h1>DJANGO METHOD TESTS</h1>")
	i=3
	for url in django_list:
		i+=1
		print("<hr>")
		print("<br><b>Test " + str(i) + "</b>")
		print("<br><b>Test input:</b> " + url)
		print("<br><b>Expected Outcome:</b> " + str(served_by_django(url)))
		print("<br><b>Actual Outcome:</b> " + str(served_by_django(url)))

main()
