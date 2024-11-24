#!/bin/bash

# Hackthebox Javascript Deobfuscation module: Decoding. Get flag fast. Assuming you didn't write a script after manually solving like me

get_flag(){
	request=$(curl -s http://ip:port/serial.php -X POST -d "param1=sample")
	echo Initial request: $request
	decoded=$(echo "$request" | base64 -d)
	echo B64 decoded: $decoded
	flag=$(curl -s http://ip:port/serial.php -X POST -d "serial=$decoded")
	echo Flag: $flag
}
get_flag