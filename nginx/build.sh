#/bin/bash
~/src/dot/bin/docker-build-flat  nginx latest
export NAME=nginx
docker kill $NAME
docker rm $NAME
docker run --name $NAME -p 8090:80  -v "$PWD/example:/etc/nginx/out" -d nonlux/nginx:latest
docker ps
sleep 2
docker logs $NAME
