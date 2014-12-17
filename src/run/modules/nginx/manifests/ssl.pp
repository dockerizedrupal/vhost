class nginx::ssl {
  exec { 'openssl genrsa -out /nginx/ssl/private/nginxCA.key 4096':
    timeout => 0,
    path => ['/usr/bin']
  }

  $subj = "/C=/ST=/L=/O=/CN=$server_name"

  exec { "openssl req -x509 -new -nodes -key /nginx/ssl/private/nginxCA.key -days 365 -subj $subj -out /nginx/ssl/certs/nginxCA.crt":
    timeout => 0,
    path => ['/usr/bin'],
    require => Exec['openssl genrsa -out /nginx/ssl/private/nginxCA.key 4096']
  }

  exec { 'openssl genrsa -out /nginx/ssl/private/nginx.key 4096':
    timeout => 0,
    path => ['/usr/bin'],
    require => Exec["openssl req -x509 -new -nodes -key /nginx/ssl/private/nginxCA.key -days 365 -subj $subj -out /nginx/ssl/certs/nginxCA.crt"]
  }

  exec { "openssl req -new -key /nginx/ssl/private/nginx.key -subj $subj -out /nginx/ssl/certs/nginx.csr":
    timeout => 0,
    path => ['/usr/bin'],
    require => Exec['openssl genrsa -out /nginx/ssl/private/nginx.key 4096']
  }

  exec { "openssl x509 -req -in /nginx/ssl/certs/nginx.csr -CA /nginx/ssl/certs/nginxCA.crt -CAkey /nginx/ssl/private/nginxCA.key -CAcreateserial -out /nginx/ssl/certs/nginx.crt -days 365":
    timeout => 0,
    path => ['/usr/bin'],
    require => Exec["openssl req -new -key /nginx/ssl/private/nginx.key -subj $subj -out /nginx/ssl/certs/nginx.csr"]
  }
}
