FROM fedora
MAINTAINER http://fedoraproject.org/wiki/Cloud

RUN dnf -y update && dnf clean all
RUN dnf -y install mysql-server mysql psmisc procps-ng && dnf clean all

ADD ./config_mysql.sh /config_mysql.sh
ADD ./my.cnf /etc/my.cnf 
ADD ./mysqlGeneral.log /var/log/mysqlGeneral.log
ADD ./dump_insta.sql /var/tmp/dump_insta.sql

RUN chmod 755 /config_mysql.sh
RUN chown mysql /var/tmp/dump_insta.sql
RUN chown mysql /var/log/mysqlGeneral.log
RUN /config_mysql.sh

EXPOSE 3306

CMD ["/usr/bin/mysqld_safe"]
