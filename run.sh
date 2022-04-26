PROJECT_NAME="playmo-api"

DOCKER_COMMAND=()
for arg in "$@"
do
  DOCKER_COMMAND+=($arg)
done

docker-compose -p $PROJECT_NAME -f docker-compose.yml -f docker-compose.env.yml ${DOCKER_COMMAND[*]}