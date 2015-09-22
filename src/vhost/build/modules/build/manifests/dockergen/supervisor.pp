class build::dockergen::supervisor {
  file { '/etc/supervisor/conf.d/dockergen.conf':
    ensure => present,
    source => 'puppet:///modules/build/etc/supervisor/conf.d/dockergen.conf',
    mode => 644
  }
}
