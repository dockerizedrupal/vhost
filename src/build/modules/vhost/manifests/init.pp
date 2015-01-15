class vhost {
  require vhost::nginx
  require vhost::php
  require vhost::dockergen

  file { '/vhost/data':
    ensure => directory,
    recurse => true,
    purge => true,
    force => true,
    owner => nginx,
    group => nginx,
    source => 'puppet:///modules/vhost/vhost/data'
  }
}
