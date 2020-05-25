# 通用开发docker环境



[TOC]



## 运行依赖



> Docker For Mac: Docker Community Edition 18.03.0-ce-rc1-mac54 2018-02-27 以上
>
> Docker For Windows: Docker Community Edition 2.0.0.0-win78 2018-11-19 以上



## Run

安装配置好http/https proxy后, 进入本项目根目录执行docker-compose up即可

第一次build完镜像之后需要执行./workspace/software/init.sh安装go的依赖包



## 项目目录说明

```
|-data										数据持久化目录

|-|-etcd									etcd数据目录

|-|-mysql									mysql数据目录

|-etc										配置文件目录

|-|-grpc-nginx								grpc-nginx相关配置

|-|-|-conf.d								confd配置

|-|-|-|-saas.conf.toml						confd新saas配置

|-|-|-templates								confd模板文件

|-|-|-|-aas.conf.tmpl						confd新saas nginx配置模板

|-|-php										php配置文件

|-|-|-php.ini								php.ini

|-|-redis									redis配置文件

|-|-|-redis.conf							redis.conf

|-etcd										etcd镜像

|-|-Dockerfile								etcd dockerfile

|-grpc-nginx								grpc-nginx镜像

|-|-confd									confd执行文件

|-|-Dockerfile								nginx dockerfile

|-|-start.sh								grpc-nginx启动脚本

|-mysql										mysql镜像

|-|-Dockerfile								mysql dockerfile

|-redis										redis镜像

|-|-Dockerfile								redis dockerfile

|-workspace									worksapce镜像

|-|-software								workspace软件包

|-|-|-etcd-v3.3.10-linux-amd64.tar.gz

|-|-|-go1.11.4.linux-amd64.tar.gz

|-|-|-grpc-1.17.0.tgz

|-|-|-init.sh								workspace镜像初始化安装脚本, 容器第一次运行后执行即可, 以后不需要再执行

|-|-|-protobuf-3.6.0.tgz

|-|-|-redis-4.2.0.tgz

|-|-|-swoole-1.10.2.tgz

|-|-Dockerfile

|-.env										docker-compose环境变量文件

|-docker-compose.yml						docker-compose描述文件
```





## 镜像说明



### workspace

> 基础镜像
>
> > debian
>
> 包含服务
>
> > PHP
> >
> > > 版本
> > >
> > > > 7.1.23
> > >
> > > 预装扩展
> > >
> > > > Grpc-1.17.0
> > > >
> > > > Protobuf-3.6.0
> > > >
> > > > Redis-4.2.0
> > > >
> > > > Swoole-1.10.2
> > >
> > > 备注
> > >
> > > > swoole和grpc扩展有冲突，会导致worker阻塞, 必须先在配置文件启用swoole扩展, 代码中在onWorkerStart回调中或之后dl动态加载grpc扩展
> >
> > composer
> >
> > > 版本
> > >
> > > > Composer version 1.8.0 2018-12-03 10:31:16
> >
> > Pecl
> >
> > > 版本
> > >
> > > > PEAR Version: 1.10.5
> > > > PHP Version: 7.1.23
> > > > Zend Engine Version: 3.1.0
> > > > Running on: Linux b53b5c392952 4.9.125-linuxkit #1 SMP Fri Sep 7 08:20:28 UTC 2018 x86_64
> >
> > GO
> >
> > > 版本
> > >
> > > > go version go1.11.4 linux/amd64
> > >
> > > GOPATH
> > >
> > > > /var/www/go (容器内)
> > >
> > > 初始化脚本
> > >
> > > > /var/www/tmp/init.sh  (容器内)
> > > >
> > > > 用于安装项目所需Go基础包
> > > >
> > > > > dep
> > > > >
> > > > > > Go包管理器
> > > > >
> > > > > proto
> > > > >
> > > > > > Go的protobuf实现库
> > > > >
> > > > > protoc-gen-go
> > > > >
> > > > > > Go Grpc protobuf plugin
> > > > >
> > > > > Grpc
> > > > >
> > > > > > Go Grpc实现库
> > > > >
> > > > > gogo/protobuf
> > > > >
> > > > > > 速度更快的protobuf实现库, 官方protobuf插件, 兼容官方protobuf
> > > > >
> > > > > xo
> > > > >
> > > > > > Go 数据库model文件生成工具, 可生成table struct和基础CURD方法
> > > > > >
> > > > > >  xo "mysql://{username}:{password}@{addr:port}/{database}" -o {modules_path} --template-path templates
> >
> > etcd
> >
> > > 版本
> > >
> > > > /etcd-v3.3.10-linux-amd64
> > >
> > > 安装目录
> > >
> > > > /var/www/etcd  (容器内)
>
> 预定义变量
>
> > PHP_WORK_SPACE
> >
> > > PHP宿主机工作目录, 用于与容器内部工作目录挂载
> >
> > GO_WORK_SPACE
> >
> > > Go宿主机工作目录, 用于与容器内部Go工作目录挂载
> >
> > HTTP_PROXY
> >
> > > 容器内部http转发, 由于Go部分包以及基础镜像软件源很可能被墙, 可通过此配置转发至宿主机以宿主机的网络对外通信, 但是宿主机必须搭建有http/https/socks 5 Proxy等服务, 搭建教程见[宿主机HTTP/HTTPS/Socks5 Proxy实现容器翻墙](#宿主机HTTP/HTTPS/Socks5 Proxy实现容器翻墙)。预设host(host.docker.internal)为容器内部访问宿主机的docker预定义host
> >
> > HTTPS_PROXY
> >
> > > 同HTTP_PROXY
> >
> > NO_PROXY
> >
> > > 可设置不转发的IP地址/域名, 即可使用容器内部网络访问目标地址
>
> 挂载目录
>
> > ./data/etcd:/data etcd数据存储
> >
> > ${PHP_WORK_SPACE}:/var/www/html PHP工作空间
> >
> > ${GO_WORK_SPACE}:/var/www/go Go工作空间
>
> 映射端口
>
> > 10000:10000
> >
> > 默认只把容器内10000端口映射至宿主机10000端口
>
> Network
>
> > 所属docker网络
> >
> > > uto
> >
> > 本镜像网络别名
> >
> > > workspace
>
> 容器名称
>
> > uto-docker_workspace_1



### Nginx

> 基础镜像
>
> > alpine
>
> 包含服务
>
> > nginx
> >
> > > 版本
> > >
> > > > 1.14
> >
> > confd
> >
> > > 版本
> > >
> > > > 0.16.0
>
> 挂载目录
>
> > ./etc/grpc-nginx:/etc/nginx/conf.d confd配置文件
> >
> > ./etc/grpc-nginx:/etc/confd	     confd模板文件
>
> 启动脚本
>
> > /confd/start.sh (容器内目录)
>
> 映射端口
>
> > 8081:80
> >
> > 默认容器内部的80端口映射至宿主机8081端口
>
> Network
>
> > 所属docker网络
> >
> > > uto
> >
> > 本镜像网络别名
> >
> > > nginx
>
> 备注
>
> > 本镜像启动脚本默认通过etcd渲染nginx配置文件, 不使用etcd的话, 可以在启动脚本中注释confd, 并删除confd相关配置文件 
>
> 容器名称
>
> > uto-docker_nginx_1



### Redis

> 基础镜像
>
> > alpine
>
> 包含服务
>
> > redis-server
> >
> > > 版本
> > >
> > > > Redis server v=5.0.3 sha=00000000:0 malloc=jemalloc-5.1.0 bits=64 build=c7148dce16f42e1d
>
> 挂载目录
>
> > ./etc/redis:/usr/local/etc/redis redis配置文件
>
> 映射端口
>
> > 6379:6379
> >
> > 默认的redis-server端口
>
> 启动命令
>
> > redis-server /usr/local/etc/redis/redis.conf
>
> Network
>
> > 所属docker网络
> >
> > > uto
> >
> > 本镜像网络别名
> >
> > > redis
>
> 容器名称
>
> > uto-docker_redis_1



### MySQL

> 基础镜像
>
> > debian
>
> 包含服务
>
> > mysql
> >
> > > 版本
> > >
> > > > 5.6
>
> 预定义变量
>
> > MYSQL_ROOT_PASSWORD
> >
> > > mysql root密码
>
> 映射端口
>
> > 3306:3306
> >
> > mysql默认端口
>
> Network
>
> > 所属docker网络
> >
> > > uto
> >
> > 本镜像网络别名
> >
> > > mysql
>
> 容器名称
>
> > uto-docker_mysql_1



## 附录

### 宿主机HTTP/HTTPS/Socks5 Proxy实现容器翻墙

* 下载shadowsocks
  * Mac 下载地址 https://github.com/shadowsocks/ShadowsocksX-NG/releases
  * Windows下载地址 https://github.com/shadowsocks/shadowsocks-windows/releases
* Mac 参考 https://www.jixian.io/2017/10/09/Mac%E5%9C%A8%E7%BB%88%E7%AB%AF%E8%BF%90%E8%A1%8CShadowsocks/
* Windows参考https://blog.csdn.net/lovelyelfpop/article/details/69586366

### docker阿里云国内镜像配置

* 参考 https://cr.console.aliyun.com/cn-hongkong/mirrors