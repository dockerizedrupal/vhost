class vhost::dockergen {
  file { '/root/nginx.conf.tmpl':
    ensure => present,
    content => template('vhost/nginx.conf.tmpl.erb')
  }

  file { '/root/vhost.html.tmpl':
    ensure => present,
    content => template('vhost/vhost.html.tmpl.erb')
  }
}
