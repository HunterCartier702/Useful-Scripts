#!/usr/bin/env python3
import requests
import hashlib
import getpass
import sys

def get_pwned_count(password):
    sha1_pass = hashlib.sha1(password.encode('utf-8')).hexdigest().upper()
    prefix = sha1_pass[:5]
    suffix = sha1_pass[5:]

    try:
        response = requests.get(f'https://api.pwnedpasswords.com/range/{prefix}')
        if response.status_code != 200:
            raise RuntimeError(f'Error fetching data: {response.status_code}')
        
        hashes = (line.split(':') for line in response.text.splitlines())
        for hash_suffix, count in hashes:
            if hash_suffix == suffix:
                return int(count)
        return 0

    except Exception as e:
        print(f"An error occurred: {e}")
        return None

def main():
    try:
        password = getpass.getpass("Enter password to check: ").strip()
        if not password:
            print("[X] Password cannot be empty.")
            sys.exit(1)

        count = get_pwned_count(password)
        if count is None:
            print("[X] Unable to check password.")
        elif count == 0:
            print("[+] Good news — no pwnage found!")
        else:
            print(f"[!] This password has been found {count:,} times! Consider choosing another one.")

    except KeyboardInterrupt:
        print("\nOperation cancelled.")
        sys.exit(1)

if __name__ == "__main__":
    main()
