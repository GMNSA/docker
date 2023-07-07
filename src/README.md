# Simple Docker
Introduction to docker. Developing a simple docker image for your own server.

## Part 1. Ready-made docker

Nginx is a lightweight and high-performance web server, proxy server, and reverse proxy server. It is designed to efficiently serve static and dynamic web content with low resource consumption and high reliability.

Nginx offers the following features and capabilities:
- Handling a large number of concurrent connections without significant overhead.
- Efficient processing of static content such as HTML, CSS, JS, and images.
- Advanced support for proxying and load balancing, allowing you to distribute traffic among multiple application servers.
- Built-in caching support to enhance performance and reduce load on backend servers.
- Security options and protection against attacks such as DoS attacks and availability attacks.
- Modularity, which allows adding additional functionality and extensions.

#### Take the official docker image from nginx and download it using docker pull.
![part1_1.png](screenshots/part1_1.png)

#### Check for the docker image with docker images
![part1_2.png](screenshots/part1_2.png)

#### Run docker image with docker run -d [image_id|repository]
![part1_3.png](screenshots/part1_3.png)

#### Check that the image is running with docker ps
![part1_4.png](screenshots/part1_4.png)

#### View container information with docker inspect [container_id|container_name]
![part1_5.png](screenshots/part1_5.png)
![part1_5_1.png](screenshots/part1_5_1.png)

#### Stop docker image with docker stop [container_id|container_name]
![part1_6.png](screenshots/part1_6.png)

#### Check that the image has stopped with docker ps
![part1_7.png](screenshots/part1_7.png)

#### Run docker with mapped ports 80 and 443 on the local machine with run command
![part1_8.png](screenshots/part1_8.png)

#### Check that the nginx start page is available in the browser at localhost:80
![part1_9.png](screenshots/part1_9.png)

#### Restart docker container with docker restart [container_id|container_name]
![part1_10.png](screenshots/part1_10.png)

## Part 2. Operations with container

#### Read the nginx.conf configuration file inside the docker container with the exec command
![part2_1.png](screenshots/part2_1.png)

####
![part2_2.png](screenshots/part2_2.png)

####
![part2_3.png](screenshots/part2_3.png)

####
![part2_4.png](screenshots/part2_4.png)

####
![part2_5.png](screenshots/part2_5.png)

####
![part2_6.png](screenshots/part2_6.png)

####
![part2_7.png](screenshots/part2_7.png)
