#!/bind/bash

docker stop img_tmp66
docker stop src-server_part5-1
docker stop src-proxy-1

docker rm img_tmp66
docker rm src-server_part5-1
docker rm src-proxy-1

docker rmi img_tmp6:last



# docker build -t img_tmp6:last .
# docker run -d --name img_tmp66 img_tmp6:last
# docker logs img_tmp66
