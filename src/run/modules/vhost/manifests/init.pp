class vhost {
  require vhost::dockergen

  if ! file_exists('/vhost/ssl/certs/vhost.crt') {
    require vhost::nginx::ssl
  }
}
