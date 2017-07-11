docker run -it -e IS_COORDINATOR=false \
-e DISCOVERY_URL=http://192.168.1.3:8081 \
--net=host \
presto-docker