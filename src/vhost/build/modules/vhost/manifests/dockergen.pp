class vhost::dockergen {
  require vhost::dockergen::supervisor

  file { '/tmp/docker-gen-linux-amd64-0.4.1.tar.gz':
    ensure => present,
    source => 'puppet:///modules/vhost/tmp/docker-gen-linux-amd64-0.4.1.tar.gz'
  }

  bash_exec { 'tar -xvzf /tmp/docker-gen-linux-amd64-0.4.1.tar.gz -C /usr/local/bin':
    require => File['/tmp/docker-gen-linux-amd64-0.4.1.tar.gz']
  }
}
