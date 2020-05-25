FROM alpine
MAINTAINER xingxiaohe@styd.cn

RUN mkdir -p /etcd/
RUN mkdir -p /data/

ENV ETCDCTL_API=3
ADD etcd-v3.3.10-linux-amd64.tar.gz /etcd/
EXPOSE 2379
WORKDIR /etcd/etcd-v3.3.10-linux-amd64/

CMD ["./etcd", "--data-dir=/data", "--listen-client-urls=http://0.0.0.0:2379", "--advertise-client-urls=http://0.0.0.0:2379"]
