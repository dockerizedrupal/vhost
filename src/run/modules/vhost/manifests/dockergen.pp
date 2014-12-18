class vhost::dockergen {
  file { '/root/nginx.tmpl':
    ensure => present,
    content => template('vhost/nginx.tmpl')
  }
}
