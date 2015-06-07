class vhost::nginx::packages {
  bash_exec { 'wget -q -O - http://nginx.org/keys/nginx_signing.key | apt-key add -': }

  file { '/etc/apt/sources.list.d/nginx.list':
    ensure => present,
    source => 'puppet:///modules/vhost/etc/apt/sources.list.d/nginx.list',
    mode => 644,
    require => Bash_exec['wget -q -O - http://nginx.org/keys/nginx_signing.key | apt-key add -']
  }

  bash_exec { 'apt-get update':
    require => File['/etc/apt/sources.list.d/nginx.list']
  }

  package {[
      'nginx'
    ]:
    ensure => present,
    require => Bash_exec['apt-get update']
  }
}
