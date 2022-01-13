# Setup

clone api project into api
`cd api && git clone git@api .`

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
