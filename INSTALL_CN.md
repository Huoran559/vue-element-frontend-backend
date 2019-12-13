---

## 描述

该项目 是open_galaxy的demo版本，open_galaxy项目使用python+django+vue+restful 技术以及框架。 demo版本是 项目的一个简化版本，技术框架一样。
open_galaxy项目请查看 http://www.bdkyr.com/open_galaxy/cn/


## 环境

```
Python 3.7.4
mysql-server 5.7
redis
node 9.4.0
Django==2.1.4
djangorestframework==3.9.0
```

## 如何运行

Clone the repository:

```zsh
    git clone https://github.com/Huoran559/vue-element-frontend-backend.git bastion 
```

创建 and 激活 virtualenv:

```zsh
➜  cd bastion 
➜  python3.7 -m venv pyenv
➜  source pyenv/bin/activate
➜  cp bastion/.env_example bastion/pyenv_extend  
#按照 自己的数据库，redis 等进行配置
➜  export $(cat pyenv_extend | grep -v '#') 
```

Run scripts from Makefile that install all dependencies, run migrations and start dev server.

```zsh
# install mysql and redis
# docker pull mysql:5.7
docker run -p 3306:3306 --privileged=true \
	--name mysql \
	-v /Users/huoran/Documents/projects/dev_env/mysql/logs:/logs \
	-v /Users/huoran/Documents/projects/dev_env/mysql/data:/var/lib/mysql \
	-v /Users/huoran/Documents/projects/dev_env/mysql/conf.d/my.cnf:/etc/mysql/mysql.conf.d/mysqld.cnf \
	-e MYSQL_ROOT_PASSWORD=q1w2e3r4 \
	-d mysql:5.7
# docker pull redis
docker run -d \
-p 6379:6379 \
-v /Users/huoran/Documents/projects/dev_env/redis/redis.conf:/etc/redis/redis.conf \
--privileged=true \
--name redis \
redis \
redis-server /etc/redis/redis.conf

# 进入docker，创建mysql database
(env) ➜  docker exec -it mysql  
# mysql -uroot -p -e "create database open_galaxy default charset utf8mb4;"

(env) ➜  make init
(env) ➜  make dev
(env) ➜  make build-prod
(env) ➜  make start
```

Nginx 配置文件 --

```
生产  请使用  项目中  demo.opengalaxy.com.conf     配置文件
开发  请使用  项目中  demo.dev.opengalaxy.com.conf 配置文件
```

We are done.

dev

- Frontend: http://localhost:9527/
- Backend: http://localhost:8004/

prod

- Frontend: http://demo.opengalaxy.com/
- Backend: http://demo.opengalaxy.com/api/
- Xadmin: http://demo.opengalaxy.com/xadmin/
- API Docs: http://demo.opengalaxy.com/docs/

默认管理员账号：admin   密码：admin@123
