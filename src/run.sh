#!/usr/bin/env bash

if [ -z "${SERVER_NAME}" ]; then
  SERVER_NAME="localhost"
fi

export FACTER_SERVER_NAME="${SERVER_NAME}"


export FACTER_HOST_IP="$(/sbin/ip route | awk '/default/ { print $3 }')"

puppet apply --modulepath=/src/run/modules /src/run/run.pp

/usr/bin/supervisord
