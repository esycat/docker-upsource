FROM esycat/java:oracle-8

MAINTAINER "Eugene Janusov" <esycat@gmail.com>

ENV APP_VERSION 3.0
ENV APP_BUILD 4389
ENV APP_PORT 8080
ENV APP_USER upsource
ENV APP_SUFFIX upsource

ENV APP_DISTNAME upsource-${APP_VERSION}.${APP_BUILD}
ENV APP_DISTFILE ${APP_DISTNAME}.zip
ENV APP_PREFIX /opt
ENV APP_DIR $APP_PREFIX/$APP_SUFFIX
ENV APP_HOME /var/lib/$APP_SUFFIX

# preparing home (data) directory and user+group
RUN mkdir $APP_HOME
RUN groupadd -r $APP_USER
RUN useradd -r -g $APP_USER -d $APP_HOME $APP_USER
RUN chown -R $APP_USER:$APP_USER $APP_HOME

# downloading and unpacking the distribution, removing bundled JVMs
WORKDIR $APP_PREFIX
RUN wget -q https://download.jetbrains.com/upsource/$APP_DISTFILE && \
    unzip -q $APP_DISTFILE && \
    mv $APP_DISTNAME $APP_SUFFIX && \
    chown -R $APP_USER:$APP_USER $APP_DIR && \
    rm -rf $APP_DIR/internal/java && \
    rm $APP_DISTFILE

USER $APP_USER
WORKDIR $APP_DIR

RUN bin/upsource.sh configure \
    --backups-dir $APP_HOME/backups \
    --data-dir    $APP_HOME/data \
    --logs-dir    $APP_HOME/log \
    --temp-dir    $APP_HOME/tmp \
    --listen-port $APP_PORT \
    --base-url    http://localhost/

ENTRYPOINT ["bin/upsource.sh"]
CMD ["run"]
EXPOSE $APP_PORT
VOLUME ["$APP_HOME"]
