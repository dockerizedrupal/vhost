# vhost

[Nginx](http://nginx.org/) proxy that displays all the running [Docker](https://www.docker.com/) containers on your host machine on a single page, heavily influenced by [nginx-proxy](https://github.com/jwilder/nginx-proxy).

## Run the container

Using the `docker` command:

    CONTAINER="vhost-data" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -v /vhost \
      dockerizedrupal/data:1.0.2
 
    CONTAINER="vhost" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      --restart always \
      -p 80:80 \
      -p 443:443 \
      --volumes-from vhost-data \
      -v /var/run/docker.sock:/var/run/docker.sock \
      -e SERVER_NAME="localhost" \
      -e TIMEOUT="900" \
      -e PROTOCOLS="https" \
      -d \
      dockerizedrupal/vhost:1.0.2

Using the `docker-compose` command

    TMP="$(mktemp -d)" \
      && git clone https://github.com/dockerizedrupal/vhost.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout 1.0.2 \
      && sudo docker-compose up

## Build the image

    TMP="$(mktemp -d)" \
      && git clone https://github.com/dockerizedrupal/vhost.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout 1.0.2 \
      && sudo docker build -t dockerizedrupal/vhost:1.0.2 . \
      && cd -

## License

**MIT**
