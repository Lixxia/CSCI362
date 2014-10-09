#import sys

#sys.path.append('/home/michaelblackburn/rtd/checkouts/readthedocs.org/deploy/')

from nginx_smoke_test import * #import proxy

def getlist(filename):
	infile = open(filename, 'r')
	mylist = []
	for line in infile:
		mylist.append(line.rstrip())
	infile.close()
	return mylist

def main():

	# may not need the clone, try it without later
	nginx_valid_list = getlist('nginx_url_test_valid')
	print("Valid nginx tests - should all return true")
	for url in nginx_valid_list:
		#served_by_nginx(url)
		print(served_by_nginx(url))
	django_valid_list = getlist('django_url_test_valid')
	print("Valid Django tests - should all return true")
	for url in django_valid_list:
		#served_by_django(url)
		print(served_by_django(url))
	perl_valid_list = getlist('perl_url_test_valid')
	print("Valid Perl tests - should all return true")
	for url in perl_valid_list:
		#served_by_perl(url)
		print(served_by_perl(url))
	served_valid_list = getlist('served_url_test_valid')
	print("Valid served tests - should all return true")
	for url in served_valid_list:
		#served(url)
		print(served(url))
	nginx_invalid_list = getlist('invalid_urls_test')
	print("Invalid nginx tests - should all return false")
	for url in nginx_invalid_list:
		#served_by_nginx(url)
		print(served_by_nginx(url))
	django_invalid_list = getlist('invalid_urls_test')
	print("Invalid Django tests - should all return false")
	for url in django_invalid_list:
		#served_by_django(url)
		print(served_by_django(url))
	perl_invalid_list = getlist('invalid_urls_test')
	print("Invalid Perl tests - should all return false")
	for url in perl_invalid_list:
		#served_by_perl(url)
		print(served_by_perl(url))
	served_invalid_list = getlist('invalid_urls_test')
	print("Invalid served tests - should all return false")
	for url in served_invalid_list:
		#served(url)
		print(served(url))

	
	
main()
