class build::vhost {
  require build::nginx

  file { '/var/www':
    ensure => directory,
    recurse => true,
    purge => true,
    force => true,
    owner => nginx,
    group => nginx,
    source => 'puppet:///modules/build/var/www'
  }
}
