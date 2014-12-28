class vhost {
  require vhost::nginx
  require vhost::dockergen

  exec { 'mkdir -p /vhost/data':
    path => ['/bin']
  }
}
