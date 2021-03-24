#!/bin/bash
urlGetAll="localhost:5050/v2/burgers?page=0&per_page=4";

while true; do 
	curl $urlGetAll; 
done
