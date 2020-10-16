FROM registry.api.weibo.com/weiboad/centos7.4:base_v2

RUN  yum install  libgomp libunwind -y \
    && mkdir -p /data0/vad/fisher/stats \
    && mkdir -p /data0/vad/fisher/log \
    && ldconfig \
    && rm -rf /tmp/* \
    && rm -rf /var/cache/yum

ADD ./ad_server_deploy/queen.tgz /data0/vad/queen/

ENV LC_ALL C

COPY ["docker-entrypoint.sh", "/usr/bin/"]
ENTRYPOINT ["/usr/bin/docker-entrypoint.sh"]