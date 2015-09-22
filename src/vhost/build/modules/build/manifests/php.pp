class build::php {
  require build::php::packages
  require build::php::supervisor

  file { '/etc/php5/fpm/php.ini':
    ensure => present,
    source => 'puppet:///modules/build/etc/php5/fpm/php.ini',
    mode   => 644
  }

  file { '/etc/php5/fpm/pool.d/www.conf':
    ensure => present,
    source => 'puppet:///modules/build/etc/php5/fpm/pool.d/www.conf',
    mode   => 644
  }
}
