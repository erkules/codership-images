FROM ubuntu:14.04
MAINTAINER erkan yanar <erkan.yanar@linsenraum.de>
ENV VERSION 20160303
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get install -y  software-properties-common
RUN apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 BC19DDBA
RUN add-apt-repository 'deb http://releases.galeracluster.com/ubuntu trusty main'
RUN apt-get update
RUN apt-get install -y galera-3 galera-arbitrator-3 mysql-wsrep-5.6 rsync lsof
RUN rm -r /var/lib/mysql


COPY my.cnf /etc/mysql/my.cnf
COPY entrypoint.sh /entrypoint.sh
RUN chmod 700 /entrypoint.sh
EXPOSE 3306/tcp
ENTRYPOINT ["/entrypoint.sh"]

