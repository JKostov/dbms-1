echo "----------------INIT CONFIG SERVER----------------"
docker-compose exec configsvr01 sh -c "mongo < /scripts/init-configserver.js"

echo "----------------INIT SHARDS----------------"
sleep 3
docker-compose exec shard01-a sh -c "mongo < /scripts/init-shard01.js"
docker-compose exec shard02-a sh -c "mongo < /scripts/init-shard02.js"
docker-compose exec shard03-a sh -c "mongo < /scripts/init-shard03.js"

echo "----------------INIT ROUTER----------------"
sleep 20
docker-compose exec router01 sh -c "mongo < /scripts/init-router.js"

echo "----------------DONE----------------"
