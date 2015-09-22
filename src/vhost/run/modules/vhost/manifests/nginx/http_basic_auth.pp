class vhost::nginx::http_basic_auth {
  bash_exec { "htpasswd -b -c /etc/htpasswd/.htpasswd '$http_basic_auth_username' '$http_basic_auth_password'":
    timeout => 0
  }
}
