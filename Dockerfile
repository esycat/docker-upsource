FROM esycat/java:oracle-8

MAINTAINER "Eugene Janusov" <esycat@gmail.com>

ENV UPSOURCE_VERSION 1.0.12566
ENV UPSOURCE_DISTFILE upsource-${UPSOURCE_VERSION}.zip
ENV UPSOURCE_HOME /var/lib/upsource
ENV UPSOURCE_PREFIX /opt
ENV UPSOURCE_BIN $UPSOURCE_PREFIX/upsource/bin/upsource.sh
ENV UPSOURCE_URL https://upsource.redlounge.io

VOLUME ["$UPSOURCE_HOME"]
ENTRYPOINT ["$UPSOURCE_BIN"]
CMD ["run"]
EXPOSE 80

# ADD https://download.jetbrains.com/upsource/$UPSOURCE_DISTFILE $UPSOURCE_PREFIX/
COPY $UPSOURCE_DISTFILE $UPSOURCE_PREFIX/
WORKDIR $UPSOURCE_PREFIX
RUN unzip $UPSOURCE_DISTFILE
RUN rm $UPSOURCE_DISTFILE
RUN mv Upsource upsource
RUN mkdir $UPSOURCE_HOME

RUN $UPSOURCE_BIN configure \
    --data-dir $UPSOURCE_HOME/data \
    --logs-dir $UPSOURCE_HOME/log \
    --temp-dir $UPSOURCE_HOME/tmp \
    --base-url $UPSOURCE_URL

