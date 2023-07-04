git --version
docker --version
cat install-docker.sh
sudo sh install-docker.sh
docker network create --subnet=192.168.0.0/16 cluster-network
cd /var/run
sudo chmod 777 docker.sock
cd
docker network create --subnet=192.168.0.0/16 cluster-network
docker run -d -h node1.rabbit            --net cluster-network --ip 192.168.0.10           --name rabbitNode1           --add-host node2.rabbit:192.168.0.11           -p "4369:4369"           -p "5672:5672"           -p "15672:15672"           -p "25672:25672"\ 
docker run -d -h node1.rabbit \ --net cluster-network --ip 192.168.0.10\ --name rabbitNode1\ --add-host node2.rabbit:192.168.0.11\ -p "4369:4369"\ -p "5672:5672"\-p "15672:15672"\-p "25672:25672"\ -p "35672:35672"\-e "RABBITMQ_USE_LONGNAME=true"\-e RABBITMQ_ERLANG_COOKIE="cookie"\rabbitmq:3-management
docker run -d -h node1.rabbit --net cluster-network --ip 192.168.0.10 --name rabbitNode1 --add-host node2.rabbit:192.168.0.11 -p "4369:4369" -p "5672:5672" -p "15672:15672" -p "25672:25672" -p "35672:35672" -e "RABBITMQ_USE_LONGNAME=true" -e "RABBITMQ_ERLANG_COOKIE=cookie" rabbitmq:3-management
docker ps
docker run -d -h node2.rabbit --net cluster-network --ip 192.168.0.11  --name rabbitNode2 --add-host node1.rabbit:192.168.0.10 -p "4370:4369" -p "5673:5672" -p "15673:15672" -p "25673:25672" -p "35673:35672" -e "RABBITMQ_USE_LONGNAME=true" -e "RABBITMQ_ERLANG_COOKIE=cookie" rabbitmq:3-management
clear
docker ps
docker exec rabbitNode2 rabbitmqctl stop_app

docker exec rabbitNode2 rabbitmqctl start_app
docker exec rabbitNode1 rabbitmqctl cluster_status
docker exec rabbitNode1 rabbitmqctl set_policy ha "." '{"ha-mode":"all"}'
docker ps
