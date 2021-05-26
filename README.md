run.sh exec mysql mysql -u root -p
run.sh exec php php /var/www/api/artisan migrate

ngrok http 8000
