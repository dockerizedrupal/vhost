class vhost::php::supervisor {
  file { '/etc/supervisor/conf.d/php.conf':
    ensure => present,
    source => 'puppet:///modules/vhost/etc/supervisor/conf.d/php.conf',
    mode => 644
  }
}
