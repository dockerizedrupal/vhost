class vhost::nginx::supervisor {
  file { '/etc/supervisor/conf.d/nginx.conf':
    ensure => present,
    source => 'puppet:///modules/nginx/etc/supervisor/conf.d/nginx.conf',
    mode => 644
  }
}
