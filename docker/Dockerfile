FROM mysql:5.7

COPY my.cnf /etc/mysql/my.cnf
COPY sql/ /docker-entrypoint-initdb.d/

ENV MYSQL_ROOT_PASSWORD root_password