# docker-vhost

[Nginx](http://nginx.org/) proxy that displays all the running [Docker](https://www.docker.com/) containers on your host machine on a single page, heavily influenced by [nginx-proxy](https://github.com/jwilder/nginx-proxy).

![example](/example.png)

## Run the container

Using the `docker` command:

    CONTAINER="vhostdata" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -v /vhost \
      viljaste/data:latest
 
    CONTAINER="vhost" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 80:80 \
      -p 443:443 \
      --volumes-from vhostdata \
      -v /var/run/docker.sock:/var/run/docker.sock \
      -e SERVER_NAME="localhost" \
      -d \
      viljaste/vhost:latest

Using the `docker-compose` command

    TMP="$(mktemp -d)" \
      && GIT_SSL_NO_VERIFY=true git clone https://git.beyondcloud.io/viljaste/docker-vhost.git "${TMP}" \
      && cd "${TMP}" \
      && sudo docker-compose up

## Build the image

    TMP="$(mktemp -d)" \
      && GIT_SSL_NO_VERIFY=true git clone https://git.beyondcloud.io/viljaste/docker-vhost.git "${TMP}" \
      && cd "${TMP}" \
      && sudo docker build -t viljaste/vhost:latest . \
      && cd -

## Back up vhost data

    sudo docker run \
      --rm \
      --volumes-from vhostdata \
      -v $(pwd):/backup \
      viljaste/base:latest tar czvf /backup/vhostdata.tar.gz /vhost

## Restore vhost data from a backup

    sudo docker run \
      --rm \
      --volumes-from vhostdata \
      -v $(pwd):/backup \
      viljaste/base:latest tar xzvf /backup/vhostdata.tar.gz

## License

**MIT**
