#!/usr/bin/env bash

if [ -z "${SERVER_NAME}" ]; then
  SERVER_NAME="localhost"
fi

export FACTER_SERVER_NAME="${SERVER_NAME}"

for VARIABLE in $(env); do
  if [[ "${VARIABLE}" =~ ^SERVER_ALIAS_[[:digit:]]+=.*$ ]]; then
    i="$(echo ${VARIABLE} | awk -F '_' '{ print $3 }' | awk -F '=' '{ print $1 }')"

    SERVER_ALIAS="SERVER_ALIAS_${i}"

    if [ -z "${!SERVER_ALIAS}" ]; then
      continue
    fi

    export "FACTER_${SERVER_ALIAS}=${!SERVER_ALIAS}"
  fi
done

if [ -z "${TIMEZONE}" ]; then
  TIMEZONE="Etc/UTC"
fi

export FACTER_TIMEZONE="${TIMEZONE}"

if [ -z "${PROXY_READ_TIMEOUT}" ]; then
  PROXY_READ_TIMEOUT="900"
fi

export FACTER_PROXY_READ_TIMEOUT="${PROXY_READ_TIMEOUT}"

if [ -z "${PROTOCOLS}" ]; then
  PROTOCOLS="https,http"
fi

PROTOCOLS=$(echo "${PROTOCOLS}" | tr "," "\n")

for PROTOCOL in ${PROTOCOLS}; do
  if [ "${PROTOCOL}" == "http" ]; then
    export FACTER_HTTP="1"
  fi

  if [ "${PROTOCOL}" == "https" ]; then
    export FACTER_HTTPS="1"
  fi
done

if [ -z "${HTTP_BASIC_AUTH}" ]; then
  HTTP_BASIC_AUTH="Off"
fi

export FACTER_HTTP_BASIC_AUTH="${HTTP_BASIC_AUTH}"

if [ -z "${HTTP_BASIC_AUTH_USERNAME}" ]; then
  HTTP_BASIC_AUTH_USERNAME="container"
fi

export FACTER_HTTP_BASIC_AUTH_USERNAME="${HTTP_BASIC_AUTH_USERNAME}"

export FACTER_HTTP_BASIC_AUTH_PASSWORD="${HTTP_BASIC_AUTH_PASSWORD}"

if [ -z "${HTTP_BASIC_AUTH_RANDOM}" ]; then
  HTTP_BASIC_AUTH_RANDOM="Off"
fi

export FACTER_HTTP_BASIC_AUTH_RANDOM="${HTTP_BASIC_AUTH_RANDOM}"

if [ -z "${HTTP_BASIC_AUTH_RANDOM_PASSWORD_LENGTH}" ]; then
  HTTP_BASIC_AUTH_RANDOM_PASSWORD_LENGTH="32"
fi

export FACTER_HTTP_BASIC_AUTH_RANDOM_PASSWORD_LENGTH="${HTTP_BASIC_AUTH_RANDOM_PASSWORD_LENGTH}"

export FACTER_HTTP_BASIC_AUTH_RANDOM_PASSWORD_SALT="${HTTP_BASIC_AUTH_RANDOM_PASSWORD_SALT}"

if [ -z "${HOSTS_IP_ADDRESS}" ]; then
  HOSTS_IP_ADDRESS="127.0.0.1"
fi

export FACTER_HOSTS_IP_ADDRESS="${HOSTS_IP_ADDRESS}"
