FROM mariadb

COPY ./dump.sql /dump.sql
COPY ./script.sh /docker-entrypoint-initdb.d/script.sh
RUN chmod 755 /docker-entrypoint-initdb.d/script.sh