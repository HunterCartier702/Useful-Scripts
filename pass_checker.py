#!/usr/bin/env python3

import requests
import hashlib
import sys


def api_req_data(query_char):
	url = 'https://api.pwnedpasswords.com/range/' + query_char
	res = requests.get(url)
	if res.status_code != 200:
		raise RuntimeError(f"Error fetching: {res.status_code}")
	return res

def get_leak_count(hashes, hash_to_check):
	hashes = (line.split(':') for line in hashes.text.splitlines())
	for h, count in hashes:
		if h == hash_to_check:
			return count
	return 0	

def pwned_api_check(password):
	#Check password if exists in api response
	sha1password = hashlib.sha1(password.encode('utf-8')).hexdigest().upper()
	first_5, tail = sha1password[:5], sha1password[5:]
	response = api_req_data(first_5)
	return get_leak_count(response, tail)

def main(args):
	for password in args:
		count = pwned_api_check(password)
		if count:
			print(f'{password} was found {count} times.')
		else:
			print(f'{password} not found')
		return 'done'

if __name__ == '__main__':
	sys.exit(main(sys.argv[1:]))