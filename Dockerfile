FROM esycat/java:oracle-8

MAINTAINER "Eugene Janusov" <esycat@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV upsource_version 1.0.12566
ENV upsource_distfile upsource-${upsource_version}.zip
ENV upsource_home /var/lib/upsource
ENV upsource_bin /opt/upsource/bin/upsource.sh
ENV upsource_url https://upsource.redlounge.io

VOLUME ["${upsource_home}"]
ENTRYPOINT ["${upsource_bin}"]
CMD ["run"]
EXPOSE 80

# ADD https://download.jetbrains.com/upsource/${upsource_distfile} /opt
COPY $upsource_distfile /opt
WORKDIR /opt
RUN unzip $upsource_distfile
RUN rm $upsource_distfile
RUN mv Upsource upsource
RUN mkdir $upsource_home

RUN $upsource_bin configure \
    --data-dir ${upsource_home}/data \
    --logs-dir ${upsource_home}/log \
    --temp-dir ${upsource_home}/tmp \
    --base-url $upsource_url

