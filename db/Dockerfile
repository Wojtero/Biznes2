FROM mariadb

COPY ./dump.sql /dump.sql
COPY ./script.sh /docker-entrypoint-initdb.d/script.sh
# RUN /etc/init.d/mysql start
# CMD ["bash", "script.sh"]
# EXPOSE 3306
RUN chmod 755 /docker-entrypoint-initdb.d/script.sh