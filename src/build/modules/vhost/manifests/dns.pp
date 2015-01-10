class vhost::dns {
  require vhost::dns::packages
  require vhost::dns::supervisor

  file { '/opt/dns':
    ensure => directory,
    recurse => true,
    purge => true,
    force => true,
    source => 'puppet:///modules/vhost/opt/dns'
  }

  exec { 'npm install':
    cwd => '/opt/dns',
    path => ['/usr/bin'],
    require => File['/opt/dns']
  }
}
