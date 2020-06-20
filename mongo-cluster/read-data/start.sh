docker build --tag cluster-read-data .

docker kill cluster-read-data
docker rm cluster-read-data

docker run --network cluster_default --name cluster-read-data cluster-read-data