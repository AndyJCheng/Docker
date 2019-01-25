# Docker
## install  
yum install epel -release -y  
yum install epel - release -y  
yum install docker* -y  

sudo groupadd docker  
sudo gpasswd -a $USER docker  
systemctl start docker  
docker image inspect --format='{{.RepoTags}} {{.Id}} {{.Parent}}' $(docker image ls -q --filter since=id)  

## Docker容器使用问题：Failed to get D-Bus connection: Operation not permitted    
在CentOS7 中，docker容器中yum 安装完httpd后，启动报错  
solution:  
docker run -d --privileged=true centos /usr/sbin/init  
docker ps  
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES  
eb15fd7394b2        centos              "/usr/sbin/init"    34 seconds ago      Up 34 seconds                           adoring_wing  
47befe1d257f        centos              "/usr/sbin/init"    4 minutes ago       Up 4 minutes                            clever_saha  
9df39d797532        centos              "/usr/sbin/init"    5 minutes ago       Up 5 minutes                            amazing_wing  
0e2a069279b0        centos              "/usr/sbin/init"    7 minutes ago       Up 7 minutes                            jolly_volhar  
docker exec -it eb15fd7394b2 /bin/bash  
systemctl start httpd  

## docker push  
docker login  
docker images  
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES  
eb15fd7394b2        40791e75c081        "/usr/sbin/init"    25 minutes ago      Up 25 minutes                           adoring_wing  
47befe1d257f        40791e75c081        "/usr/sbin/init"    29 minutes ago      Up 29 minutes                           clever_saha  
9df39d797532        40791e75c081        "/usr/sbin/init"    29 minutes ago      Up 29 minutes                           amazing_wing  
0e2a069279b0        40791e75c081        "/usr/sbin/init"    32 minutes ago      Up 32 minutes                           jolly_volhar  
docker tag 40791e75c081 dunksky/centos:v1  
docker push dunksky/centos:v1  
