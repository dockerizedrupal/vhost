class vhost::nginx::timeout {
  file { '/etc/nginx/conf.d/timeout.conf':
    ensure => present,
    content => template('vhost/timeout.conf.erb'),
    mode => 644
  }
}
