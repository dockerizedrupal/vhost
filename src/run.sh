#!/usr/bin/env bash

if [ -z "${SERVER_NAME}" ]; then
  SERVER_NAME="localhost"
fi

export FACTER_SERVER_NAME="${SERVER_NAME}"

puppet apply --modulepath=/src/run/modules /src/run/run.pp

/usr/bin/supervisord
