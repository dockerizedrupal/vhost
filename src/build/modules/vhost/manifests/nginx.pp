class vhost::nginx {
  require vhost::nginx::packages
  require vhost::nginx::supervisor

  exec { 'mkdir -p /vhost/data':
    path => ['/bin']
  }

  file { '/etc/nginx/conf.d/example_ssl.conf':
    ensure => absent
  }

  file { '/etc/nginx/nginx.conf':
    ensure => present,
    source => 'puppet:///modules/vhost/etc/nginx/nginx.conf',
    mode   => 644
  }
}
