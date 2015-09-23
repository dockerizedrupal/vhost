# vhost

The front page of your development environment.

## Run the container

    CONTAINER="vhost-data" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -v /vhost \
      dockerizedrupal/data:1.0.3
 
    CONTAINER="vhost" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      --restart always \
      -p 80:80 \
      -p 443:443 \
      --volumes-from vhost-data \
      -v /var/run/docker.sock:/var/run/docker.sock \
      -v /etc/hosts:/hosts \
      -e SERVER_NAME="localhost" \
      -e TIMEZONE="Etc/UTC" \
      -e TIMEOUT="900" \
      -e PROTOCOLS="https,http" \
      -e HTTP_BASIC_AUTH_USERNAME="container" \
      -e HTTP_BASIC_AUTH_PASSWORD="" \
      -d \
      dockerizedrupal/vhost:1.0.7

## Build the image

    TMP="$(mktemp -d)" \
      && git clone https://github.com/dockerizedrupal/vhost.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout 1.0.7 \
      && sudo docker build -t dockerizedrupal/vhost:1.0.7 . \
      && cd -

## Changing the container behaviour on runtime through environment variables

    // TODO

## License

**MIT**
