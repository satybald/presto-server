echo "Building Image"
VERSION=0.1
IMAGE=presto-docker:$VERSION
docker build -t $IMAGE .

docker run -it \
-e IS_COORDINATOR=true \
-e IS_DISCOVERY_ENABLED=false \
-e DISCOVERY_URL=http://192.168.1.3:8081 \
--net=host \
$IMAGE