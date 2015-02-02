FROM esycat/java:oracle-8

MAINTAINER "Eugene Janusov" <esycat@gmail.com>

ENV UPSOURCE_VERSION 1.0.12566
ENV UPSOURCE_HOME /var/lib/upsource
ENV UPSOURCE_PORT 80

ENV UPSOURCE_DISTFILE upsource-${UPSOURCE_VERSION}.zip
ENV UPSOURCE_PREFIX /opt
ENV UPSOURCE_DIR $UPSOURCE_PREFIX/upsource

VOLUME ["$UPSOURCE_HOME"]
EXPOSE $UPSOURCE_PORT

WORKDIR $UPSOURCE_PREFIX
ADD https://download.jetbrains.com/upsource/$UPSOURCE_DISTFILE $UPSOURCE_PREFIX/
# COPY $UPSOURCE_DISTFILE $UPSOURCE_PREFIX/ # for local testing only
RUN unzip $UPSOURCE_DISTFILE
RUN rm $UPSOURCE_DISTFILE
RUN mv Upsource upsource
WORKDIR $UPSOURCE_DIR

RUN groupadd -r upsource
RUN useradd -r -g upsource -d $UPSOURCE_HOME upsource
RUN chown -R upsource:upsource $UPSOURCE_DIR $UPSOURCE_HOME

# USER upsource

RUN bin/upsource.sh configure \
    --backups-dir $UPSOURCE_HOME/backups \
    --data-dir    $UPSOURCE_HOME/data \
    --logs-dir    $UPSOURCE_HOME/log \
    --temp-dir    $UPSOURCE_HOME/tmp \
    --listen-port $UPSOURCE_PORT \
    --base-url    http://localhost/

ENTRYPOINT ["bin/upsource.sh"]
CMD ["run"]
