FROM ubuntu:trusty

MAINTAINER "Eugene Janusov" <esycat@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV upsource_version 1.0.12566
ENV upsource_distfile upsource-${upsource_version}.zip
ENV upsource_url https://upsource.redlounge.io

VOLUME ["/var/lib/upsource"]
ENTRYPOINT ["/opt/upsource/bin/upsource.sh"]
CMD ["start"]
EXPOSE 8080

# OS update
RUN apt-get update
#RUN apt-get upgrade -y

RUN apt-get install -y \
    python-software-properties \
    software-properties-common \
    unzip

# Java install
RUN echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
RUN echo debconf shared/accepted-oracle-license-v1-1 seen   true | debconf-set-selections

RUN mkdir /var/cache/oracle-jdk8-installer
COPY jdk-8u31-linux-x64.tar.gz /var/cache/oracle-jdk8-installer/

RUN add-apt-repository ppa:webupd8team/java
RUN apt-get update
RUN apt-get install -y oracle-java8-installer # oracle-java8-set-default

# Upsource install and configure
WORKDIR /opt

# ADD https://download.jetbrains.com/upsource/${upsource_distfile} /opt/
COPY ${upsource_distfile} /opt/
RUN unzip $upsource_distfile
RUN rm $upsource_distfile
RUN mv Upsource upsource

RUN /opt/upsource/bin/upsource.sh configure --base-url $upsource_url

# OS clean up
RUN apt-get clean
RUN rm -rf /tmp/* /var/tmp/* /var/lib/apt/archive/* /var/lib/apt/lists/*
RUN rm -rf /var/cache/oracle-{jre,jdk}*-installer

