class vhost::dockergen::supervisor {
  file { '/etc/supervisor/conf.d/dockergen.conf':
    ensure => present,
    source => 'puppet:///modules/vhost/etc/supervisor/conf.d/dockergen.conf',
    mode => 644
  }
}
