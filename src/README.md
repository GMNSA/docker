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

#### Create a nginx.conf file on a local machine
![part2_2.png](screenshots/part2_2.png)

#### Configure it on the /status path to return the nginx server status page
![part2_3.png](screenshots/part2_3.png)

#### Copy the created nginx.conf file inside the docker image using the docker cp command
![part2_4.png](screenshots/part2_4.png)

#### Restart nginx inside the docker image with exec
![part2_5.png](screenshots/part2_5.png)

#### Check that localhost:80/status returns the nginx server status page
![part2_6.png](screenshots/part2_6.png)

#### Export the container to a container.tar file with the export command
![part2_7.png](screenshots/part2_7.png)

#### Stop the container
![part2_8.png](screenshots/part2_8.png)

#### Delete the image with docker rmi [image_id|repository]without removing the container first
![part2_9.png](screenshots/part2_9.png)

#### Delete stopped container
![part2_10.png](screenshots/part2_10.png)

#### Import the container back using the importcommand
<! The default parameters in the command `docker import -c 'CMD ["nginx", "-g", "daemon off;"]' container.tar` specify the default command that Docker will execute when running the imported container. In this case, the default parameters indicate Docker to run the    Nginx web server inside the container.

Analyzing the default parameters presented in the command `CMD ["nginx", "-g", "daemon off;"]`, we can break them down into the following elements:

1. `["nginx"]`: This sets the executable file that Docker will run inside the container. In this example, it is set to Nginx.

2. `["-g", "daemon off;"]`: These are command-line arguments passed as parameters when executing the Nginx command. In this case, `-g` specifies a global configuration option, and `daemon off;` disables the Nginx daemon mode.

In summary, these default parameters mean that when starting the Nginx container, Docker will execute the Nginx command with the specified arguments ("-g" and "daemon off;"), causing Nginx to run in the foreground (non-daemon mode) and use the specified global     configuration. >
![part2_11.png](screenshots/part2_11.png)

#### Run the imported container
![part2_12.png](screenshots/part2_12.png)

#### Check that localhost:80/status returns the nginx server status page
![part2_13.png](screenshots/part2_13.png)
![part2_14.png](screenshots/part2_14.png)

## Part 3. Mini web server

####
![part3_1.png](screenshots/part3_1.png)

####
![part3_2.png](screenshots/part3_2.png)

####
![part3_3.png](screenshots/part3_3.png)

####
![part3_4.png](screenshots/part3_4.png)

####
![part3_5.png](screenshots/part3_5.png)

####
![part3_6.png](screenshots/part3_6.png)
