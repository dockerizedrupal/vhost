class vhost::php {
  require vhost::php::packages
  require vhost::php::supervisor

  file { '/etc/php5/fpm/php.ini':
    ensure => present,
    source => 'puppet:///modules/vhost/etc/php5/fpm/php.ini',
    mode   => 644
  }
}
