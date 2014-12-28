class vhost::dockergen {
  file { '/root/vhost.conf.tmpl':
    ensure => present,
    content => template('vhost/vhost.conf.tmpl.erb')
  }

  file { '/root/vhost.html.tmpl':
    ensure => present,
    content => template('vhost/vhost.html.tmpl.erb')
  }
}
