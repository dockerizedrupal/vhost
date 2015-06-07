class vhost {
  require vhost::nginx
  require vhost::php
  require vhost::dockergen

  file { '/var/www':
    ensure => directory,
    recurse => true,
    purge => true,
    force => true,
    owner => nginx,
    group => nginx,
    source => 'puppet:///modules/vhost/var/www'
  }
}
