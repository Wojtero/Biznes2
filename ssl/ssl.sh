#!/bin/sh
# cd /etc/apache2/
# cp -R /ssl/default-ssl.conf /etc/sites-available/default-ssl.conf
a2enmod ssl
# a2enmod rewrite
echo "siema"
service apache2 restart
apachectl -D FOREGROUND