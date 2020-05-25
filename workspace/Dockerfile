FROM php:7.1-fpm
MAINTAINER xingxiaohe@styd.cn

RUN mkdir -p /var/www/tmp \
RUN mkdir -p /var/www/tmp/data \
    && mkdir -p /var/www/etcd \
    && mkdir -p /var/www/go \
    && mkdir /usr/local/go

COPY ./software/* /var/www/tmp/
COPY ./start.sh /var/www/

ENV PATH=$PATH:/usr/local/go/bin:/var/www/go/bin \
    GOPATH=/var/www/go

#RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak && \
#    echo "deb http://mirrors.163.com/debian/ jessie main non-free contrib" >/etc/apt/sources.list && \
#    echo "deb http://mirrors.163.com/debian/ jessie-proposed-updates main non-free contrib" >>/etc/apt/sources.list && \
#    echo "deb-src http://mirrors.163.com/debian/ jessie main non-free contrib" >>/etc/apt/sources.list && \
#    echo "deb-src http://mirrors.163.com/debian/ jessie-proposed-updates main non-free contrib" >>/etc/apt/sources.list \
#    &&
RUN set -xe \
    && buildDeps=" \
       $PHP_EXTRA_BUILD_DEPS \
       " \
	&& apt-get update \
	&& apt-get install -y zlib1g-dev \
	&& apt-get install -y --force-yes $buildDeps --no-install-recommends \
	&& apt-get install -y git \
	&& apt-get install -y vim \
	&& apt-get install -y procps \
	&& apt-get install -y net-tools \
	&& apt-get install -y iputils-ping \
    && docker-php-source extract \
    && pecl install /var/www/tmp/grpc-1.17.0.tgz \
    && pecl install /var/www/tmp/protobuf-3.6.0.tgz \
    && pecl install /var/www/tmp/redis-4.2.0.tgz \
    && pecl install /var/www/tmp/swoole-1.10.2.tgz \
# swoole和grpc扩展有冲突，会导致worker阻塞, 必须先在配置文件启用swoole扩展, 代码中在onWorkerStart回调中dl动态加载grpc扩展
#    && docker-php-ext-enable grpc \
    && docker-php-ext-enable protobuf \
    && docker-php-ext-enable swoole \
    && docker-php-ext-enable redis \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install bcmath \
    && curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer \
    && tar -zxvf /var/www/tmp/etcd-v3.3.10-linux-amd64.tar.gz -C /var/www/tmp/ \
    && mv /var/www/tmp/etcd-v3.3.10-linux-amd64/* /var/www/etcd/ \
    && tar -zxvf /var/www/tmp/go1.11.4.linux-amd64.tar.gz -C /var/www/tmp/ \
    && mv /var/www/tmp/go/* /usr/local/go \
    && echo 'alias ll="ls -al"' > /root/.bashrc

EXPOSE 2379
EXPOSE 9000
