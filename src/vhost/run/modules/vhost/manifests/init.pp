class vhost {
  require vhost::nginx
  require vhost::dockergen

  file { '/var/www/index.php':
    ensure => present,
    content => template('vhost/index.php.erb'),
    owner => nginx,
    group => nginx,
    mode => 755
  }
}
