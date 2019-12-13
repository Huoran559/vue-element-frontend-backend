
cd dev_tools/django
docker build -t django:v1 .
cd ..
docker-compose up

# 登陆mysql docker
# docker exec -it mysql /bin/bash
# 登陆 shell 后， 建open_galaxy 
# mysql -uroot -p -e "create database open_galaxy default charset utf8mb4;"
