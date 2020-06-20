# MongoDB Cluster

## Pre-reqs

To build and run this app locally you will need a few things:
- Install [Docker](https://docs.docker.com/engine/install/ubuntu/)

## Running the project

- Clone the repository
```
git clone git@github.com:JKostov/dbms-1.git
```
- Go in the mongo-cluster folder
```
cd mongo-cluster
```

- Start the cluster and wait for all containers to initialize
```
docker-compose up
```

- Execute `start.sh` script to initialize the mongo cluster
```
./start.sh
```

- Start the NodeJS client for inserting data
```
cd ./insert-data/
start.sh
```

- Enable sharding of the create collection
```
cd ..
./enable-sharding.sh
```

- Run the insert data application multiple times to insert many recored
```
cd ./insert-data/
start.sh
```

- Start new console and run insert-data in parallel
```
start.sh 2
```

- After the data is inserted get the shard distribution infomartion in the cluster
```
./get-shard-distribution.sh
```