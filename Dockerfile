FROM viljaste/base:latest

MAINTAINER Jürgen Viljaste <j.viljaste@gmail.com>

ENV TERM xterm
ENV DEBIAN_FRONTEND noninteractive

ADD ./src /src

RUN /src/vhost.sh build

VOLUME ["/vhost"]

EXPOSE 80
EXPOSE 443

CMD ["/src/vhost.sh", "run"]
