class vhost {
  require vhost::dockergen

  if ! file_exists('/vhost/ssl/certs/vhost.crt') {
    require vhost::nginx::ssl
  }

  file { '/etc/nginx/conf.d/default.conf':
    ensure => present,
    content => template('vhost/default.conf.erb'),
    mode => 644
  }

  file { '/etc/nginx/conf.d/default-ssl.conf':
    ensure => present,
    content => template('vhost/default-ssl.conf.erb'),
    mode => 644
  }
}
