class vhost::nginx::ssl {
  exec { 'mkdir -p /vhost/ssl':
    path => ['/bin']
  }

  exec { 'mkdir -p /vhost/ssl/private':
    path => ['/bin'],
    require => Exec['mkdir -p /vhost/ssl']
  }

  exec { 'mkdir -p /vhost/ssl/certs':
    path => ['/bin'],
    require => Exec['mkdir -p /vhost/ssl/private']
  }

  file { '/root/opensslCA.cnf':
    ensure => present,
    content => template('vhost/opensslCA.cnf.erb'),
    require => Exec['mkdir -p /vhost/ssl/certs']
  }

  exec { 'openssl genrsa -out /vhost/ssl/private/vhostCA.key 4096':
    timeout => 0,
    path => ['/usr/bin'],
    require => File['/root/opensslCA.cnf']
  }

  exec { "openssl req -sha256 -x509 -new -days 3650 -extensions v3_ca -config /root/opensslCA.cnf -key /vhost/ssl/private/vhostCA.key -out /vhost/ssl/certs/vhostCA.crt":
    timeout => 0,
    path => ['/usr/bin'],
    require => Exec['openssl genrsa -out /vhost/ssl/private/vhostCA.key 4096']
  }

  exec { 'openssl genrsa -out /vhost/ssl/private/vhost.key 4096':
    timeout => 0,
    path => ['/usr/bin'],
    require => Exec["openssl req -sha256 -x509 -new -days 3650 -extensions v3_ca -config /root/opensslCA.cnf -key /vhost/ssl/private/vhostCA.key -out /vhost/ssl/certs/vhostCA.crt"]
  }

  file { '/root/openssl.cnf':
    ensure => present,
    content => template('vhost/openssl.cnf.erb'),
    require => Exec['openssl genrsa -out /vhost/ssl/private/vhost.key 4096']
  }

  exec { "openssl req -sha256 -new -config /root/openssl.cnf -key /vhost/ssl/private/vhost.key -out /vhost/ssl/certs/vhost.csr":
    timeout => 0,
    path => ['/usr/bin'],
    require => File['/root/openssl.cnf']
  }

  exec { "openssl x509 -req -sha256 -CAcreateserial -days 3650 -extensions v3_req -extfile /root/opensslCA.cnf -in /vhost/ssl/certs/vhost.csr -CA /vhost/ssl/certs/vhostCA.crt -CAkey /vhost/ssl/private/vhostCA.key -out /vhost/ssl/certs/vhost.crt":
    timeout => 0,
    path => ['/usr/bin'],
    require => Exec["openssl req -sha256 -new -config /root/openssl.cnf -key /vhost/ssl/private/vhost.key -out /vhost/ssl/certs/vhost.csr"]
  }
}
