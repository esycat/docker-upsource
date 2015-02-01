FROM esycat/java:oracle-8

MAINTAINER "Eugene Janusov" <esycat@gmail.com>

ENV UPSOURCE_VERSION 1.0.12566
ENV UPSOURCE_DISTFILE upsource-${UPSOURCE_VERSION}.zip
ENV UPSOURCE_HOME /var/lib/upsource
ENV UPSOURCE_PREFIX /opt
ENV UPSOURCE_BIN $UPSOURCE_PREFIX/upsource/bin/upsource.sh
ENV UPSOURCE_PORT 80

VOLUME ["$UPSOURCE_HOME"]
EXPOSE $UPSOURCE_PORT
ENTRYPOINT ["/opt/upsource/bin/upsource.sh"]
CMD ["run"]

WORKDIR $UPSOURCE_PREFIX
ADD https://download.jetbrains.com/upsource/$UPSOURCE_DISTFILE $UPSOURCE_PREFIX/
# COPY $UPSOURCE_DISTFILE $UPSOURCE_PREFIX/ # for local testing only
RUN unzip $UPSOURCE_DISTFILE
RUN rm $UPSOURCE_DISTFILE
RUN mv Upsource upsource

RUN $UPSOURCE_BIN configure \
    --data-dir $UPSOURCE_HOME/data \
    --logs-dir $UPSOURCE_HOME/log \
    --temp-dir $UPSOURCE_HOME/tmp \
    --listen-port $UPSOURCE_PORT

