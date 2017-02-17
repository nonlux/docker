#/bin/bash
export NAME="base_nginx"
docker kill $NAME
docker rm $NAME
docker rmi nonlux/nginx:big
echo $NAME
set -e
docker build . -t nonlux/nginx:big
docker-squash nonlux/nginx:big -t nonlux/nginx:base
docker run --name $NAME -p 8090:80  -v "$PWD/example:/etc/nginx/out" -d nonlux/nginx:base
docker ps
docker logs $NAME
