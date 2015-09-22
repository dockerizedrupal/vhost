class build::nginx {
  require build::nginx::packages
  require build::nginx::supervisor

  file { '/etc/nginx/conf.d/example_ssl.conf':
    ensure => absent
  }

  file { '/etc/nginx/conf.d/default.conf':
    ensure => absent
  }

  file { '/etc/nginx/nginx.conf':
    ensure => present,
    source => 'puppet:///modules/build/etc/nginx/nginx.conf',
    mode   => 644
  }

  bash_exec { 'mkdir -p /etc/htpasswd': }
}
