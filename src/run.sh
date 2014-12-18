#!/usr/bin/env bash

export FACTER_SERVER_NAME="localhost"

puppet apply --modulepath=/src/run/modules /src/run/run.pp

/usr/bin/supervisord
