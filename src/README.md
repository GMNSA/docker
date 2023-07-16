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
> The `docker pull` command is used to pull (download) Docker images from a container registry. This command allows you to obtain images from various sources, such as Docker Hub or private registries, and store them locally on your machine.

![part1_1.png](screenshots/part1_1.png)

#### Check for the docker image with docker images
> To list the Docker images that are available on your system, you can use the `docker images` command. This command will display a list of all the Docker images along with their respective details, such as repository, tag, image ID, creation date, and size.
To run the command, open a terminal or command prompt and enter the following:

![part1_2.png](screenshots/part1_2.png)

#### Run docker image with docker run -d [image_id|repository]
> The `docker run -d` command is used to run a Docker container in detached mode. Detached mode means the container runs in the background without attaching the container's console to the terminal where the `docker run` command was executed.


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
> The default parameters in the command `docker import -c 'CMD ["nginx", "-g", "daemon off;"]' container.tar` specify the default command that Docker will execute when running the imported container. In this case, the default parameters indicate Docker to run the    Nginx web server inside the container.

> Analyzing the default parameters presented in the command `CMD ["nginx", "-g", "daemon off;"]`, we can break them down into the following elements:

> 1. `["nginx"]`: This sets the executable file that Docker will run inside the container. In this example, it is set to Nginx.

> 2. `["-g", "daemon off;"]`: These are command-line arguments passed as parameters when executing the Nginx command. In this case, `-g` specifies a global configuration option, and `daemon off;` disables the Nginx daemon mode.

> In summary, these default parameters mean that when starting the Nginx container, Docker will execute the Nginx command with the specified arguments ("-g" and "daemon off;"), causing Nginx to run in the foreground (non-daemon mode) and use the specified global     configuration.

![part2_11.png](screenshots/part2_11.png)

#### Run the imported container
![part2_12.png](screenshots/part2_12.png)

#### Check that localhost:80/status returns the nginx server status page
![part2_13.png](screenshots/part2_13.png)
![part2_14.png](screenshots/part2_14.png)

## Part 3. Mini web server

#### Write a mini server in C and FastCgi that will return a simple page saying Hello World!
> `<fcgi_stdio.h>` is a header file from the FastCGI library that provides functions and macros for working with the FastCGI protocol. FastCGI is a language-independent protocol that allows a web server to communicate with a separate application or service to handle dynamic web content.

![part3_1.png](screenshots/part3_1.png)
![part3_1_1.png](screenshots/part3_1_1.png)
![part3_1_2.png](screenshots/part3_1_2.png)
![part3_1_3.png](screenshots/part3_1_3.png)


#### Write your own nginx.conf that will proxy all requests from port 81 to 127.0.0.1:8080
> `fastcgi_pass` is a configuration directive in the Nginx server's `nginx.conf` file that specifies where Nginx should forward FastCGI requests. It determines the address to which the FastCGI server expects connections to be made.

![part3_2.png](screenshots/part3_2.png)
![part3_2_2.png](screenshots/part3_2_2.png)

#### Run the written mini server via spawn-fcgi on port 8080
![part3_3.png](screenshots/part3_3.png)

#### Check that browser on localhost:81 returns the page you wrote
![part3_4.png](screenshots/part3_4.png)

#### Put the nginx.conf file under ./nginx/nginx.conf (you will need this later)
![part3_5.png](screenshots/part3_5.png)

## Part 4. Your own docker

#### Write your docker file.

![part4_1.png](screenshots/part4_1.png)

> script (bash) mini compile mini server

![part4_2.png](screenshots/part4_2.png)


#### Build the written docker image with docker build, specifying the name and tag

> docker build -t "server name": "tag" . (dir)

![part4_3.png](screenshots/part4_3.png)

#### Check with docker images that everything is built correctly
![part4_4.png](screenshots/part4_4.png)

#### Run the built docker image by mapping port 81 to 80 on the local machine and mapping the ./nginx folder inside the container to the address where the nginx configuration files are located.

>   In the context of Docker, mapping refers to the process of connecting (mapping) a port or a directory inside a container to a port or directory on the host machine.
    Port mapping allows you to bind a container's port to a specific port on the host machine. For example, you can run a web server in a container listening on port 80 and map that port to port 8080 on the host. This way, when you access port 8080 on the host, the    traffic will be directed to port 80 inside the container.
    Directory mapping allows you to link a directory inside the container to a specific directory or path on the host machine. This enables file and data sharing between the container and the host. For example, you can map a local directory on the host to a directory  inside the container, so that the container has access to the files, or to store data generated within the container on the host.

> `-v $(pwd)/nginx:/path/inside/container` maps the local directory `./nginx` to the path inside the container.

![part4_5.png](screenshots/part4_5.png)

![part4_6.png](screenshots/part4_6.png)

#### Check that the page of the written mini server is available on localhost:80

![part4_7.png](screenshots/part4_7.png)

#### Add proxying of /status page in ./nginx/nginx.conf to return the nginx server status

![part4_8.png](screenshots/part4_8.png)

#### Check that localhost:80/status now returns a page with nginx status

![part4_9.png](screenshots/part4_9.png)
