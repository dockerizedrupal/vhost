class vhost::dockergen {
  file { '/root/vhost.conf.tmpl':
    ensure => present,
    content => template('vhost/vhost.conf.tmpl.erb')
  }

  file { '/root/vhost.php.tmpl':
    ensure => present,
    content => template('vhost/vhost.php.tmpl.erb')
  }

  file { '/root/htpasswd_generator.sh.tmpl':
    ensure => present,
    content => template('vhost/htpasswd_generator.sh.tmpl.erb'),
    mode => 644
  }

  file { '/root/hosts_generator.sh.tmpl':
    ensure => present,
    content => template('vhost/hosts_generator.sh.tmpl.erb'),
    mode => 644
  }
}
