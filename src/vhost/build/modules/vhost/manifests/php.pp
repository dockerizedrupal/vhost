class vhost::php {
  require vhost::php::packages
  require vhost::php::supervisor

  file { '/etc/php5/fpm/php.ini':
    ensure => present,
    source => 'puppet:///modules/vhost/etc/php5/fpm/php.ini',
    mode   => 644
  }

  file { '/etc/php5/fpm/pool.d/www.conf':
    ensure => present,
    source => 'puppet:///modules/vhost/etc/php5/fpm/pool.d/www.conf',
    mode   => 644
  }
}
