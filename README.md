# docker-vhost

[Nginx](http://nginx.org/) proxy that displays all the running [Docker](https://www.docker.com/) containers on your host machine on a single page, heavily influenced by [nginx-proxy](https://github.com/jwilder/nginx-proxy).

![example](/example.png)

## Run the container

Using the `docker` command:

    CONTAINER="vhostdata" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -v /vhost \
      simpledrupalcloud/data:latest
 
    CONTAINER="vhost" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 80:80 \
      -p 443:443 \
      --volumes-from vhostdata \
      -v /var/run/docker.sock:/var/run/docker.sock \
      -v /:/host:ro \
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

## Start the container automatically

    SERVER_NAME="localhost"

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-vhost.git "${TMP}" \
      && cd "${TMP}" \
      && sudo cp ./fig.yml /opt/vhost.yml \
      && sudo sed -i "s/localhost/${SERVER_NAME}/g" /opt/vhost.yml \
      && sudo cp ./vhost.conf /etc/init/vhost.conf \
      && cd -

## Back up vhost data

    sudo docker run \
      --rm \
      --volumes-from vhostdata \
      -v $(pwd):/backup \
      simpledrupalcloud/base:latest tar czvf /backup/vhostdata.tar.gz /vhost

## Restore vhost data from a backup

    sudo docker run \
      --rm \
      --volumes-from vhostdata \
      -v $(pwd):/backup \
      simpledrupalcloud/base:latest tar xzvf /backup/vhostdata.tar.gz

## License

**MIT**
