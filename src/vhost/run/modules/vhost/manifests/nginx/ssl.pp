class vhost::nginx::ssl {
  bash_exec { 'mkdir -p /vhost/ssl': }

  bash_exec { 'mkdir -p /vhost/ssl/private':
    require => Bash_exec['mkdir -p /vhost/ssl']
  }

  bash_exec { 'mkdir -p /vhost/ssl/certs':
    require => Bash_exec['mkdir -p /vhost/ssl/private']
  }

  file { '/root/opensslCA.cnf':
    ensure => present,
    content => template('vhost/opensslCA.cnf.erb'),
    require => Bash_exec['mkdir -p /vhost/ssl/certs']
  }

  bash_exec { 'openssl genrsa -out /vhost/ssl/private/vhostCA.key 4096':
    timeout => 0,
    require => File['/root/opensslCA.cnf']
  }

  bash_exec { "openssl req -sha256 -x509 -new -days 3650 -extensions v3_ca -config /root/opensslCA.cnf -key /vhost/ssl/private/vhostCA.key -out /vhost/ssl/certs/vhostCA.crt":
    timeout => 0,
    require => Bash_exec['openssl genrsa -out /vhost/ssl/private/vhostCA.key 4096']
  }

  bash_exec { 'openssl genrsa -out /vhost/ssl/private/vhost.key 4096':
    timeout => 0,
    require => Bash_exec["openssl req -sha256 -x509 -new -days 3650 -extensions v3_ca -config /root/opensslCA.cnf -key /vhost/ssl/private/vhostCA.key -out /vhost/ssl/certs/vhostCA.crt"]
  }

  file { '/root/openssl.cnf':
    ensure => present,
    content => template('vhost/openssl.cnf.erb'),
    require => Bash_exec['openssl genrsa -out /vhost/ssl/private/vhost.key 4096']
  }

  bash_exec { "openssl req -sha256 -new -config /root/openssl.cnf -key /vhost/ssl/private/vhost.key -out /vhost/ssl/certs/vhost.csr":
    timeout => 0,
    require => File['/root/openssl.cnf']
  }

  bash_exec { "openssl x509 -req -sha256 -CAcreateserial -days 3650 -extensions v3_req -extfile /root/opensslCA.cnf -in /vhost/ssl/certs/vhost.csr -CA /vhost/ssl/certs/vhostCA.crt -CAkey /vhost/ssl/private/vhostCA.key -out /vhost/ssl/certs/vhost.crt":
    timeout => 0,
    require => Bash_exec["openssl req -sha256 -new -config /root/openssl.cnf -key /vhost/ssl/private/vhost.key -out /vhost/ssl/certs/vhost.csr"]
  }

  file { '/root/openssl_wildcard.cnf':
    ensure => present,
    content => template('vhost/openssl_wildcard.cnf.erb'),
    require => Bash_exec['openssl genrsa -out /vhost/ssl/private/vhost.key 4096']
  }

  bash_exec { "openssl req -sha256 -new -config /root/openssl_wildcard.cnf -key /vhost/ssl/private/vhost.key -out /vhost/ssl/certs/vhost_wildcard.csr":
    timeout => 0,
    require => File['/root/openssl_wildcard.cnf']
  }

  bash_exec { "openssl x509 -req -sha256 -CAcreateserial -days 3650 -extensions v3_req -extfile /root/opensslCA.cnf -in /vhost/ssl/certs/vhost_wildcard.csr -CA /vhost/ssl/certs/vhostCA.crt -CAkey /vhost/ssl/private/vhostCA.key -out /vhost/ssl/certs/vhost_wildcard.crt":
    timeout => 0,
    require => Bash_exec["openssl req -sha256 -new -config /root/openssl_wildcard.cnf -key /vhost/ssl/private/vhost.key -out /vhost/ssl/certs/vhost_wildcard.csr"]
  }
}
