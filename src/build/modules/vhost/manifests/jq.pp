class vhost::jq {
  file { '/tmp/jq':
    ensure => present,
    source => 'puppet:///modules/vhost/tmp/jq',
    mode => 755
  }

  bash_exec { 'mv /tmp/jq /usr/local/bin/jq':
    require => File['/tmp/jq']
  }
}
