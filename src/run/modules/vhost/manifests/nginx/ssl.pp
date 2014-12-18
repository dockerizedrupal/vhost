class vhost::nginx::ssl {
  exec { 'openssl genrsa -out /vhost/ssl/private/vhostCA.key 4096':
    timeout => 0,
    path => ['/usr/bin']
  }

  $subjCA = "/C=/ST=/L=/O=/CN=$server_name"
  $subj = "/C=/ST=/L=/O=/CN=*.$server_name"

  exec { "openssl req -x509 -new -nodes -key /vhost/ssl/private/vhostCA.key -days 365 -subj $subjCA -out /vhost/ssl/certs/vhostCA.crt":
    timeout => 0,
    path => ['/usr/bin'],
    require => Exec['openssl genrsa -out /vhost/ssl/private/vhostCA.key 4096']
  }

  exec { 'openssl genrsa -out /vhost/ssl/private/vhost.key 4096':
    timeout => 0,
    path => ['/usr/bin'],
    require => Exec["openssl req -x509 -new -nodes -key /vhost/ssl/private/vhostCA.key -days 365 -subj $subjCA -out /vhost/ssl/certs/vhostCA.crt"]
  }

  exec { "openssl req -new -key /vhost/ssl/private/vhost.key -subj $subj -out /vhost/ssl/certs/vhost.csr":
    timeout => 0,
    path => ['/usr/bin'],
    require => Exec['openssl genrsa -out /vhost/ssl/private/vhost.key 4096']
  }

  exec { "openssl x509 -req -in /vhost/ssl/certs/vhost.csr -CA /vhost/ssl/certs/vhostCA.crt -CAkey /vhost/ssl/private/vhostCA.key -CAcreateserial -out /vhost/ssl/certs/vhost.crt -days 365":
    timeout => 0,
    path => ['/usr/bin'],
    require => Exec["openssl req -new -key /vhost/ssl/private/vhost.key -subj $subj -out /vhost/ssl/certs/vhost.csr"]
  }
}
