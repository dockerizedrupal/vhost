FROM simpledrupalcloud/base:dev

MAINTAINER Simple Drupal Cloud <support@simpledrupalcloud.com>

ENV TERM linux
ENV DEBIAN_FRONTEND noninteractive

ADD ./src /src

RUN apt-get update

RUN /src/build.sh
RUN /src/clean.sh

VOLUME ["/vhost/ssl/certs"]
VOLUME ["/vhost/ssl/private"]

EXPOSE 80
EXPOSE 443
EXPOSE 53/udp

CMD ["/src/run.sh"]
