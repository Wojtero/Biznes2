#!/bin/bash

DATABASE_NAME="be_175718"
DATABASE_USER="be_175718"
DATABASE_PASSWORD="pass"
DATABASE_ROOT_PASSWORD="student"
SHOP_URL="localhost:5718"
SHOP_SSL_URL="localhost:5717"

mysql -p$DATABASE_ROOT_PASSWORD -e "CREATE DATABASE IF NOT EXISTS ${DATABASE_NAME};"
mysql -p$DATABASE_ROOT_PASSWORD -e "CREATE USER IF NOT EXISTS ${DATABASE_USER}@'%' IDENTIFIED BY '${DATABASE_PASSWORD}';"
mysql -p$DATABASE_ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON ${DATABASE_NAME}.* TO '${DATABASE_USER}'@'%';"
mysql -p$DATABASE_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"
mysql -u $DATABASE_USER -p$DATABASE_PASSWORD $DATABASE_NAME < /dump.sql

mysql -u $DATABASE_USER -p$DATABASE_PASSWORD $DATABASE_NAME -e "UPDATE ps_shop_url SET domain='${SHOP_URL}', domain_ssl='${SHOP_SSL_URL}' WHERE id_shop_url=1;"
mysql -u $DATABASE_USER -p$DATABASE_PASSWORD $DATABASE_NAME -e "UPDATE ps_homeslider_slides_lang SET url=REPLACE(url, 'localhost', '${SHOP_SSL_URL}');"
mysql -u $DATABASE_USER -p$DATABASE_PASSWORD $DATABASE_NAME -e "UPDATE ps_configuration_lang SET value=REPLACE(value, 'localhost', '${SHOP_SSL_URL}') WHERE id_configuration=434;"