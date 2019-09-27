#!/usr/bin/env bash

#配置DaoCloud镜像站(/etc/docker/daemon.json)
curl -sSL https://get.daocloud.io/daotools/set_mirror.sh | sh -s http://f1361db2.m.daocloud.io
docker pull image_name
docker images
# 删除所有镜像
docker rmi `docker images -q`
# 删除所有容器
docker rm `docker ps -a -q`
# 后台启动
docker run -itd --name=nginx images_name
# 进入容器
docker exec -it nginx /bin/bash
# 退出容器
exit
# 提交修改
docker commit -a 'author' -m 'message' container_id new_image_name:tag
# 端口映射
docker run -itd -p 主机端口:容器端口
docker run -itd --name=nginx -p 8888:80 nginx
# 文件挂载
docker run -itd -v 主机目录:容器目录

docker run -itd --name=nginx -p 8888:80 -v /home/cheng/index.html:/usr/share/nginx/html/index.html nginx