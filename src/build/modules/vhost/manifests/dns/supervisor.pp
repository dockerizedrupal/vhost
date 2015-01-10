class vhost::dns::supervisor {
  file { '/etc/supervisor/conf.d/dns.conf':
    ensure => present,
    source => 'puppet:///modules/vhost/etc/supervisor/conf.d/dns.conf',
    mode => 644
  }
}
