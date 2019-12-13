init:
	cd frontend && cnpm install
	pip install -r backend/requirements.txt -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com
	python backend/manage.py makemigrations && python backend/manage.py migrate
	python backend/manage.py init_users
	python backend/manage.py init_cmdb
	python backend/manage.py collectstatic --noinput

migrate:
	source env/bin/activate && python backend/manage.py makemigrations && python backend/manage.py migrate

dev:
	docker restart mysql
	docker restart redis
	npm run --prefix frontend dev &
	source pyenv/bin/activate 
	export $(cat pyenv_extend | grep -v '#') 

	python backend/manage.py runserver & 
	
	# npm run --prefix frontend dev & python backend/manage.py runserver

start:
	test ! -f backend/logs/uwsgi.pid && source env/bin/activate && uwsgi --ini backend/uwsgi.ini || echo 'uwsgi running'

stop:
	test -f backend/logs/uwsgi.pid && source env/bin/activate && uwsgi --stop backend/logs/uwsgi.pid || echo 'uwsgi closed'

build-prod:
	npm run --prefix frontend  build:prod
	source env/bin/activate && python backend/manage.py collectstatic --noinput
	test ! -f backend/logs/uwsgi.pid && source env/bin/activate && uwsgi --ini backend/uwsgi.ini || echo 'uwsgi running'

build-test:
	npm run --prefix frontend  build:test
	source env/bin/activate && python backend/manage.py collectstatic --noinput
	source env/bin/activate && uwsgi --reload backend/logs/uwsgi.pid
