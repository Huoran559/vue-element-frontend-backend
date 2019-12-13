# docker pull mysql:5.7
docker run -p 3306:3306 --privileged=true \
	--name mysql \
	-v /Users/huoran/Documents/projects/dev_env/mysql/logs:/logs \
	-v /Users/huoran/Documents/projects/dev_env/mysql/data:/var/lib/mysql \
	-v /Users/huoran/Documents/projects/dev_env/mysql/conf.d/my.cnf:/etc/mysql/mysql.conf.d/mysqld.cnf \
	-e MYSQL_ROOT_PASSWORD=q1w2e3r4 \
	-d mysql:5.7
