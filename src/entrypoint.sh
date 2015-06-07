#!/usr/bin/env bash

case "${1}" in
  build)
    /bin/su - root -mc "apt-get update && /src/vhost/build.sh && /src/vhost/clean.sh"
    ;;
  run)
    /bin/su - root -mc "source /src/vhost/variables.sh && /src/vhost/run.sh"
    ;;
esac
