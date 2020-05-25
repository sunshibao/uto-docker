FROM nginx:1.14-alpine
MAINTAINER xingxiaohe@styd.cn

RUN mkdir -p /confd/ && mkdir -p /etc/confd/{conf.d,templates}

COPY confd /confd

COPY ./start.sh /confd