FROM php:7.2-fpm

RUN docker-php-ext-install pdo pdo_mysql

RUN apt-get update && \
  apt-get install -y nano libfreetype6-dev libjpeg62-turbo-dev libpng-dev && \
  docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ && \
  docker-php-ext-install gd

RUN apt-get update && apt-get install -y cron

RUN apt-get update && apt-get install -y libmagickwand-dev --no-install-recommends && rm -rf /var/lib/apt/lists/*

RUN printf "\n" | pecl install imagick

RUN docker-php-ext-enable imagick

# Add crontab file in the cron directory
ADD crontab /etc/cron.d/cron
# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/cron
# Create the log file to be able to run tail
RUN touch /var/log/cron.log
# Run the command on container startup
CMD cron && docker-php-entrypoint php-fpm