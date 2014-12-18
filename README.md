# docker-vhost

If you are familiar with [nginx-proxy](https://github.com/jwilder/nginx-proxy) then you know

A [Docker](https://docker.com/) container for [Nginx](http://nginx.org/) and docker-gen.

## Run the container

Using the `docker` command:

    CONTAINER="vhostdata" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -v /vhost/ssl/certs \
      -v /vhost/ssl/private \
      simpledrupalcloud/data:latest
 
    CONTAINER="vhost" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 80:80 \
      -p 443:443 \
      --volumes-from vhostdata \
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
