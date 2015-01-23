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

  file { '/vhost/data/index.php':
    ensure => present,
    content => template('vhost/index.php.erb'),
    owner => nginx,
    group => nginx,
    mode => 755
  }
}
