# docker-vhost

## Build the image

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-vhost.git "${TMP}" \
      && cd "${TMP}" \
      && sudo docker build -t simpledrupalcloud/vhost:latest . \
      && cd -

## License

**MIT**
