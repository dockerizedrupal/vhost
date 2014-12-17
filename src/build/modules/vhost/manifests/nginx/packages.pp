class vhost::nginx::packages {
  exec { '/bin/bash -c "wget -q -O - http://nginx.org/keys/nginx_signing.key | apt-key add -"': }

  file { '/etc/apt/sources.list.d/nginx.list':
    ensure => present,
    source => 'puppet:///modules/vhost/etc/apt/sources.list.d/nginx.list',
    mode => 644,
    require => Exec['/bin/bash -c "wget -q -O - http://nginx.org/keys/nginx_signing.key | apt-key add -"']
  }

  exec { 'apt-get update':
    path => ['/usr/bin'],
    require => File['/etc/apt/sources.list.d/nginx.list']
  }

  package {[
      'nginx'
    ]:
    ensure => present,
    require => Exec['apt-get update']
  }
}
