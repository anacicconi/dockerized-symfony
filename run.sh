BLUE='\x1B[1;34m';

# Import variables
source .env

# Install Symfony

ls ./www/*/ >/dev/null 2>&1 ;

if [ $? == 0 ];
then
  echo -e "${BLUE}Symfony is already installed"
else
  echo -e "${BLUE}Installing Symfony"
  cd $PWD/www && symfony new ${SITE_NAME} ${SYMFONY_VERSION}
  PARENT_DIR=$(dirname `pwd`)
  cd ${PARENT_DIR}
fi

echo -e "${BLUE}Deleting all containers";
docker-compose down

echo -e "${BLUE}Launching all containers";
docker-compose up -d

sleep 45;

echo -e "${BLUE}Installing and updating vendors";
docker exec -it ${APP_CONTAINER_NAME} bash -c "cd /var/www/${SITE_NAME};/usr/local/bin/composer selfupdate"
docker exec -it ${APP_CONTAINER_NAME} bash -c "cd /var/www/${SITE_NAME};/usr/local/bin/composer install"
