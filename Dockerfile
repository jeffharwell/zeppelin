FROM gcr.io/google-containers/zeppelin:v0.5.6_v1
MAINTAINER Jeff Harwell <jeff.harwell@gmail.com>

## This is, of course, non-ideal.
## If I had the dockerfile for the GCR image I would do this differently
RUN apt-get -y update
RUN apt-get -y upgrade

#RUN wget https://github.com/grails/grails-core/releases/download/v${GRAILS_VERSION}/grails-${GRAILS_VERSION}.zip && \
#    unzip grails-${GRAILS_VERSION}.zip && \
#    rm -rf grails-${GRAILS_VERSION}.zip && \
#    ln -s grails-${GRAILS_VERSION} grails

## Grab and unpack Zeppelin
RUN wget http://apache.mirrors.tds.net/zeppelin/zeppelin-0.7.2/zeppelin-0.7.2-bin-all.tgz && \
    tar -xvf ./zeppelin-0.7.2-bin-all.tgz

## Snag the original Zeppelin config, install the new version, then copy the config back in
RUN mkdir /config_backup && \
    cp /opt/zeppelin/conf/* /config_backup
RUN mkdir /run_backup && \
    cp /opt/zeppelin/bin/* /run_backup
RUN rm -fr /opt/zeppelin
RUN mv ./zeppelin-0.7.2-bin-all /opt/zeppelin
RUN ls /config_backup/
RUN cp /config_backup/zeppelin-env.sh /opt/zeppelin/conf/
RUN cp /config_backup/log4j.properties /opt/zeppelin/conf/
RUN cp /run_backup/docker-zeppelin.sh /opt/zeppelin/bin/

## Cleanup
RUN rm -fr /config_backup
RUN rm -fr /run_backup
RUN rm ./zeppelin-0.7.2-bin-all.tgz

## And Clean the Cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
