#!/bin/bash

docker stop nginx_part4
docker rm nginx_part4

# docker run -d --name nginx_part4 -p 80:81 -v $(pwd)/server/nginx:/etc/nginx custom_nginx

# docker run -d --name nginx_part4 -p 81:80 -v ./nginx/:/etc/nginx/
# docker logs nginx_part4
