class build::nginx::supervisor {
  file { '/etc/supervisor/conf.d/nginx.conf':
    ensure => present,
    source => 'puppet:///modules/build/etc/supervisor/conf.d/nginx.conf',
    mode => 644
  }

  file { '/etc/supervisor/conf.d/nginx_stdout.conf':
    ensure => present,
    source => 'puppet:///modules/build/etc/supervisor/conf.d/nginx_stdout.conf',
    mode => 644
  }

  file { '/etc/supervisor/conf.d/nginx_stderr.conf':
    ensure => present,
    source => 'puppet:///modules/build/etc/supervisor/conf.d/nginx_stderr.conf',
    mode => 644
  }
}
