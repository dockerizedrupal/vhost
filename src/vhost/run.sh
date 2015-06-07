#!/usr/bin/env bash

puppet apply --modulepath=/src/vhost/run/modules /src/vhost/run/run.pp

supervisord -c /etc/supervisor/supervisord.conf
