class vhost::jq {
  file { '/tmp/jq':
    ensure => present,
    source => 'puppet:///modules/vhost/tmp/jq',
    mode => 755
  }

  exec { 'mv /tmp/jq /usr/local/bin/jq':
    path => ['/bin'],
    require => File['/tmp/jq']
  }
}
