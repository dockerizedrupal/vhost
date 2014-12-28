class vhost {
  require vhost::nginx
  require vhost::php
  require vhost::dockergen

  file { '/vhost/data/index.php':
    ensure => present,
    source => 'puppet:///modules/vhost/vhost/data/index.php',
    mode   => 755
  }
}
