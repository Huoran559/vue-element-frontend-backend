# docker build -t django:v1 .
FROM python:3.7
ENV PYTHONUNBUFFERED 1
RUN apt update
RUN apt install -y build-essential

RUN apt install -y apt-utils zlibc zlib1g-dev
RUN apt install -y python3.7-dev pkg-config libfreetype6-dev openssl libxml2-dev libxslt1-dev python-lxml
RUN apt install -y libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev
RUN apt install -y libcurl4-openssl-dev
RUN apt install -y libevent-dev libldap2-dev libsasl2-dev
RUN apt install -y graphviz libgraphviz-dev pkg-config
RUN apt install -y libcairo2-dev libjpeg-dev libgif-dev
RUN mkdir /backend
WORKDIR /backend
COPY ./requirements.txt /
RUN python3.7 -m pip install -r /requirements.txt


