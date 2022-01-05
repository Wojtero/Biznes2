FROM prestashop/prestashop:1.7.8.0

RUN apt update
# RUN apt-get install -y git
RUN apt-get install nano
RUN cd /
# RUN git clone --single-branch https://github.com/Wojtero/BiznesKursy

ARG DATABASE_HOST=mariadb
ARG DATABASE_PORT=''
ARG DATABASE_NAME=prestashop
ARG DATABASE_USER=root
ARG DATABASE_PASSWORD=siema
ARG DATABASE_PREFIX=ps_

RUN rm -R /var/www/html/*
COPY presta_src /var/www/html

RUN chmod -R 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

RUN sed -i "s|'new-mysql'|'${DATABASE_HOST}'|g" ./app/config/parameters.php
RUN sed -i "s|''|'${DATABASE_PORT}'|g" ./app/config/parameters.php
RUN sed -i "s|'prestashop'|'${DATABASE_NAME}'|g" ./app/config/parameters.php
RUN sed -i "s|'database_user' => 'root'|'database_user' => '${DATABASE_USER}'|g" ./app/config/parameters.php
RUN sed -i "s|'database_password' => 'root'|'database_password' => '${DATABASE_PASSWORD}'|g" ./app/config/parameters.php
RUN sed -i "s|'ps_'|'${DATABASE_PREFIX}'|g" ./app/config/parameters.php

RUN mkdir /ssl
RUN mkdir /etc/apache2/certs
RUN rm /etc/apache2/sites-available/default-ssl.conf
COPY ssl/default-ssl.conf /etc/apache2/sites-available/default-ssl.conf
COPY ssl/default-ssl.conf /etc/apache2/sites-enabled/default-ssl.conf
COPY ssl/zad.crt /etc/apache2/certs/zad.crt
COPY ssl/zad.key /etc/apache2/certs/zad.key
COPY ssl/rootCA.crt /etc/apache2/certs/rootCA.crt

EXPOSE 80
EXPOSE 443

RUN rm -rf install

RUN a2enmod ssl
RUN service apache2 restart
