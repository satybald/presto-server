docker run -it \
-e IS_COORDINATOR=true \
-e DISCOVERY_URL=http://192.168.1.3:8081 \
--net=host \
presto-docker