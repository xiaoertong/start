#!/bin/bash
set +e
source /data0/vad/fisher/env/set_env.sh
sed -i "s/tag=*.IDC/tag=${IDC}/g" /data0/vad/queen/conf/fisher.gflags
sed -i "s/ad_server_idc=*.IDC/ad_server_idc=${IDC}/g" /data0/vad/queen/conf/fisher.gflags
sed -i '/^-ad_service_name=/d' /data0/vad/queen/conf/fisher.gflags
sed -i '/^-ad_service_consul_address/d' /data0/vad/queen/conf/fisher.gflags
echo -e "-ad_service_consul_address=127.0.0.1:8500\n-ad_service_name=ad_service_prod" >> /data0/vad/queen/conf/fisher.gflags
echo -e "-exp_log_service_path=com.weibo.api.mcq.rpc.KafkaService" >> /data0/vad/queen/conf/fisher.gflags


/data0/vad/queen/bin/ad_server --flagfile=/data0/vad/queen/conf/fisher.gflags