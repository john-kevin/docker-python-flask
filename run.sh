#!/bin/bash

docker stop py-api
docker rm py-api

cp flaskenv .flaskenv

docker build -t python-api .
docker run -d -p 5000:5000 --name="py-api" python-api:latest 

echo "======================="

docker ps -a
