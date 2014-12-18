# docker-vhost

## Run the container

Using the `docker` command:

    CONTAINER="vhost" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 80:80 \
      -p 443:443 \
      -v /var/run/docker.sock:/var/run/docker.sock \
      -e SERVER_NAME="localhost" \
      -d \
      simpledrupalcloud/vhost:latest

Using the `fig` command

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-vhost.git "${TMP}" \
      && cd "${TMP}" \
      && sudo fig up

## Build the image

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-vhost.git "${TMP}" \
      && cd "${TMP}" \
      && sudo docker build -t simpledrupalcloud/vhost:latest . \
      && cd -

## License

**MIT**
