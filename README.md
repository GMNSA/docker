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

* search for nginx docker to install.

![part1_1.png](screenshots/part1_1.png)

* upload nginx.

![part1_1_1.png](screenshots/part1_1_2.png)

#### Check for the docker image with docker images
> To list the Docker images that are available on your system, you can use the `docker images` command. This command will display a list of all the Docker images along with their respective details, such as repository, tag, image ID, creation date, and size.
To run the command, open a terminal or command prompt and enter the following:

* displaying images.

![part1_2.png](screenshots/part1_2.png)

#### Run docker image with docker run -d [image_id|repository]
> The `docker run -d` command is used to run a Docker container in detached mode. Detached mode means the container runs in the background without attaching the container's console to the terminal where the `docker run` command was executed.

* running on th background of nginx.

![part1_3.png](screenshots/part1_3.png)

#### Check that the image is running with docker ps
![part1_4.png](screenshots/part1_4.png)

#### View container information with docker inspect [container_id|container_name]
![part1_5.png](screenshots/part1_5.png)

* separate size, list of mapped ports and container ip.

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

## Part 3. Mini web server

#### Write a mini server in C and FastCgi that will return a simple page saying Hello World!
> `<fcgi_stdio.h>` is a header file from the FastCGI library that provides functions and macros for working with the FastCGI protocol. FastCGI is a language-independent protocol that allows a web server to communicate with a separate application or service to handle dynamic web content.

![part3_1.png](screenshots/part3_1.png)

* run nginx on port 81 and give the name nginx_part3.

![part3_1_1.png](screenshots/part3_1_1.png)

* check running containers, exec bash on nginx_part3 and update and install gcc libfcgi-dev spawn-fcgi

![part3_1_3.png](screenshots/part3_1_3.png)


#### Write your own nginx.conf that will proxy all requests from port 81 to 127.0.0.1:8080
> `fastcgi_pass` is a configuration directive in the Nginx server's `nginx.conf` file that specifies where Nginx should forward FastCGI requests. It determines the address to which the FastCGI server expects connections to be made.

![part3_2.png](screenshots/part3_2.png)

* copy nginx.conf to nginx_part3:/etc/nginx/

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

* copy nginx.

![part4_5.png](screenshots/part4_5.png)

> `-v $(pwd)/nginx:/path/inside/container` maps the local directory `./nginx` to the path inside the container.

![part4_6.png](screenshots/part4_6.png)

#### Check that the page of the written mini server is available on localhost:80

![part4_7.png](screenshots/part4_7.png)

#### Add proxying of /status page in ./nginx/nginx.conf to return the nginx server status

![part4_8.png](screenshots/part4_8.png)

#### Check that localhost:80/status now returns a page with nginx status

![part4_9.png](screenshots/part4_9.png)

## Part 5. Dockle.

> The `-rm` option in the `docker run` command is used for automatically removing the container after it has exited. When a container exits or is stopped, the `-rm` flag automatically removes it along with any associated resources.

#### Check the image from the previous task with dockle [image_id|repository]
* install dockle in docker.

![part5_1.png](screenshots/part5_1.png)

* docker run --rm  -v /var/run/docker.sock:/var/run/docker.sock goodwithtech/dockle my_nginx_part4 (mount dockle to nginx for check.)

![part5_2.png](screenshots/part5_2.png)
#### Fix the image so that there are no errors or warnings when checking with dockle
> The `docker alpine` command you provided seems to be incomplete. However, based on the context, it appears that you are referring to running a Docker container based on the Alpine Linux distribution. \
    **Security**: `Alpine Linux` is attractive for its focus on security. It is equipped with a minimal set of components, which reduces the number of potential vulnerabilities and attacks. In addition, Alpine Linux is actively being updated and patched to maintain the security of attack vectors and provide security updates. \
    FIX: CIS-DI-0010 \
    \
FIX: CIS-DI-0005. Health statements allow you to monitor the status and availability of the application in the container \

* Fix Docklefile

![part5_3.png](screenshots/part5_3.png)

* Putting together a fixed project.

![part5_4_0.png](screenshots/part5_4_0.png)

* Checking.

![part5_4.png](screenshots/part5_4.png)

## Part 6. Basic Docker Compose

> Docker Compose is a tool that allows you to define and run multi-container Docker applications. It uses a YAML file (commonly named `docker-compose.yml`) to define the services, networks, and volumes required for your application. \
> \
> `proxy_pass` is a configuration directive in Docker used with Nginx to set up a reverse proxy.
It defines the address of the proxy server to which requests should be forwarded when they come to a specific path. This directive allows transparently redirecting requests inside the Docker network to another service or container.


#### Write a docker-compose.yml file, using which:
#### 1) Start the docker container from Part 5 (it must work on local network, i.e., you don't need to use EXPOSE instruction and map ports to local machine)
#### Map port 8080 of the second container to port 80 of the local machine
> EXPOSE -> other containers can access it or establish a connection with it through this port.
* docker-compose.yml

![part6_3.png](screenshots/part6_3.png)

* dockerfile of proxy.

![part6_1.png](screenshots/part6_1.png)

* nginx.conf of proxy.

![part6_5.png](screenshots/part6_5.png)

* remove the excess.

![part6_4.png](screenshots/part6_4.png)

#### 2) Start the docker container with nginx which will proxy all requests from port 8080 to port 81 of the first container
#### Build and run the project with the docker-compose build and docker-compose up commands

* docker-compose build

![part6_2.png](screenshots/part6_2.png)

* docker-copose up

![part6_6.png](screenshots/part6_6.png)

#### Check that the browser returns the page you wrote on localhost:80 as before

* check localhost:80

![part6_7.png](screenshots/part6_7.png)

* check localhost:80/status (server) and localhost:80/proxy

![part6_8.png](screenshots/part6_8.png)
