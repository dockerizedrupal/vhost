class vhost::nginx {
  include vhost::nginx::timeout

  if $http and $https {
    if ! file_exists('/vhost/ssl/certs/vhost.crt') {
      require vhost::nginx::ssl
    }

    file { '/etc/nginx/conf.d/http_https.conf':
      ensure => present,
      content => template('vhost/http_https.conf.erb'),
      mode => 644
    }

    file { '/etc/nginx/conf.d/http_https-ssl.conf':
      ensure => present,
      content => template('vhost/http_https-ssl.conf.erb'),
      mode => 644
    }
  }
  elsif $http {
    file { '/etc/nginx/conf.d/http.conf':
      ensure => present,
      content => template('vhost/http.conf.erb'),
      mode => 644
    }
  }
  elsif $https {
    if ! file_exists('/vhost/ssl/certs/vhost.crt') {
      require vhost::nginx::ssl
    }

    file { '/etc/nginx/conf.d/https.conf':
      ensure => present,
      content => template('vhost/https.conf.erb'),
      mode => 644
    }

    file { '/etc/nginx/conf.d/https-ssl.conf':
      ensure => present,
      content => template('vhost/https-ssl.conf.erb'),
      mode => 644
    }
  }
}
