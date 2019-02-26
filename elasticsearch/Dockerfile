FROM dbertolotto/openjdk:jre-8

ARG VERSION=6.6.0
ARG ES_PATH_CONF=/etc/elasticsearch

### install elasticsearch from debian package
RUN apt-get update && \
    apt-get install -y wget gnupg apt-transport-https && \
    wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add - && \
    echo "deb https://artifacts.elastic.co/packages/oss-6.x/apt stable main" | tee -a /etc/apt/sources.list.d/elastic-6.x.list && \
    apt-get update && \
    apt-get install -y elasticsearch-oss=$VERSION && \
    apt-get autoremove --purge -y wget gnupg apt-transport-https && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/*

COPY elasticsearch.yaml ${ES_PATH_CONF}/elasticsearch.yaml
COPY jvm.options ${ES_PATH_CONF}/jvm.options
COPY log4j2.properties ${ES_PATH_CONF}/log4j2.properties

### Keystore creation for secure settings
RUN elasticsearch-keystore create

# setup users, groups and permissions
RUN groupadd --gid 1000 elasticsearch && \
    useradd --uid 1000 --gid 1000 --home /usr/share/elasticsearch elasticsearch
#
RUN mkdir /usr/share/elasticsearch/config && \
    mkdir /usr/share/elasticsearch/data && \
    mkdir /usr/share/elasticsearch/logs && \
#    chown -R root:filebeat /usr/share/filebeat && \
#    find /usr/share/filebeat -type d -exec chmod 0750 {} \; && \
#    find /usr/share/filebeat -type f -exec chmod 0640 {} \; && \
#    chmod 0750 /usr/share/filebeat/bin/filebeat && \
#    chmod 0770 /usr/share/filebeat/module && \
#    chmod 0770 /usr/share/filebeat/data && \
#    chmod 0770 /usr/share/filebeat/logs
#
## add config file
#ADD filebeat.yml /usr/share/filebeat/filebeat.yml
#RUN chown root:filebeat /usr/share/filebeat/filebeat.yml && \
#    chmod 0640 /usr/share/filebeat/filebeat.yml
#
## start service and finalize
#CMD service filebeat start
#WORKDIR /usr/share/filebeat
#USER filebeat
