class vhost {
  require vhost::nginx::ssl
  require vhost::dockergen
}
