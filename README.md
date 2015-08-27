# docker-vhost

[Nginx](http://nginx.org/) proxy that displays all the running [Docker](https://www.docker.com/) containers on your host machine on a single page, heavily influenced by [nginx-proxy](https://github.com/jwilder/nginx-proxy).

## Run the container

Using the `docker` command:

    CONTAINER="vhostdata" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -v /vhost \
      dockerizedrupal/data:latest
 
    CONTAINER="vhost" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      --restart always \
      -p 80:80 \
      -p 443:443 \
      --volumes-from vhostdata \
      -v /var/run/docker.sock:/var/run/docker.sock \
      -e SERVER_NAME="localhost" \
      -e TIMEOUT="900" \
      -e PROTOCOLS="https" \
      -d \
      dockerizedrupal/vhost:latest

Using the `docker-compose` command

    TMP="$(mktemp -d)" \
      && git clone https://github.com/dockerizedrupal/vhost.git "${TMP}" \
      && cd "${TMP}" \
      && sudo docker-compose up

## Build the image

    TMP="$(mktemp -d)" \
      && git clone https://github.com/dockerizedrupal/vhost.git "${TMP}" \
      && cd "${TMP}" \
      && sudo docker build -t dockerizedrupal/vhost:latest . \
      && cd -

## License

**MIT**
