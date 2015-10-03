# vhost

The front page of your development environment.

This project is part of the [Dockerized Drupal](https://dockerizedrupal.com/) initiative.

## Run the container

    CONTAINER="vhost-data" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -v /vhost \
      dockerizedrupal/data:1.1.0
 
    CONTAINER="vhost" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      --restart always \
      -p 80:80 \
      -p 443:443 \
      --volumes-from vhost-data \
      -v /var/run/docker.sock:/var/run/docker.sock:ro \
      -v /etc/hosts:/hosts \
      -e SERVER_NAME="localhost" \
      -e SERVER_ALIAS_1="localhost" \
      -e TIMEZONE="Etc/UTC" \
      -e PROXY_READ_TIMEOUT="900" \
      -e PROTOCOLS="https,http" \
      -e HOSTS_IP_ADDRESS="127.0.0.1" \
      -e HTTP_BASIC_AUTH="Off" \
      -e HTTP_BASIC_AUTH_USERNAME="container" \
      -e HTTP_BASIC_AUTH_PASSWORD="" \
      -e HTTP_BASIC_AUTH_RANDOM="Off" \
      -e HTTP_BASIC_AUTH_RANDOM_PASSWORD_LENGTH="32" \
      -e HTTP_BASIC_AUTH_RANDOM_PASSWORD_SALT="" \
      -d \
      dockerizedrupal/vhost:1.1.2

## Build the image

    TMP="$(mktemp -d)" \
      && git clone https://github.com/dockerizedrupal/vhost.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout 1.1.2 \
      && sudo docker build -t dockerizedrupal/vhost:1.1.2 . \
      && cd -

## Changing the container behaviour on runtime through environment variables

    // TODO

## License

**MIT**
