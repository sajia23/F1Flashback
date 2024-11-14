# docker pull influxdb
# docker pull mysql
docker network create --subnet 172.20.0.0/16 f1_flashback_subnet

echo "Stopping current containers..."

docker rm -f f1-flashback-influxdb
docker rm -f f1-flashback-mysql

echo "Starting new containers..."

# docker run -d \
#   --name f1-flashback-influxdb \
#   --net f1_flashback_subnet --ip 172.20.0.102 \
#   -p 8086:8086 \
#   influxdb

docker run \
 --name f1-flashback-influxdb \
 --net f1_flashback_subnet --ip 172.20.0.102 \
 --publish 8086:8086 \
 --env DOCKER_INFLUXDB_INIT_MODE=setup \
 --env DOCKER_INFLUXDB_INIT_USERNAME=admin \
 --env DOCKER_INFLUXDB_INIT_PASSWORD=admin \
 --env DOCKER_INFLUXDB_INIT_ORG=sajia23 \
 --env DOCKER_INFLUXDB_INIT_BUCKET=f1-flashback-racing \
 --detach \
 influxdb

# docker exec f1-flashback-influxdb influx setup \
#   --username admin \
#   --password admin \
#   --org sajia23 \
#   --bucket f1-flashback-racing \
#   --token f1-flashback-token \
#   --force

docker run -d \
  --name f1-flashback-mysql \
  --net f1_flashback_subnet --ip 172.20.0.105 \
  -e MYSQL_ROOT_PASSWORD=password \
  -p 3306:3306 \
  -v $(pwd)/create_entities.sql:/docker-entrypoint-initdb.d/init_mysql.sql \
  mysql



# cd patent_infri_app_backend

# docker build -t f1-flashback-backend .
# docker run -t -d \
#     --name f1-flashback-backend-container \
#     --net f1_flashback_subnet --ip 172.20.0.130 \
#     -p 5001:5000 \
#     f1-flashback-backend

# docker exec f1-flashback-backend-container python rel_db_initialize.py patents.json

# cd ..



