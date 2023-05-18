# Setup

clone api project into api
`cd api && git clone git@api .`

sudo chown -R $USER:www-data storage
sudo chown -R $USER:www-data bootstrap/cache
chmod -R 775 storage
chmod -R 755 bootstrap/cache

run.sh build
run.sh up
run.sh exec php composer install

set .env file
set `DB_HOST=mysql`
run.sh exec php php artisan key:generate
run.sh exec php php artisan config:cache

# extra commands

run.sh exec mysql mysql -u root -p
run.sh exec php php /var/www/api/artisan migrate

ngrok http 8000

# Supervisor (Queue background worker for PHP)

https://www.digitalocean.com/community/tutorials/how-to-install-and-manage-supervisor-on-ubuntu-and-debian-vps
# playmo
# playmo
# api-docker
