class vhost::docker::packages {
  exec { '/bin/bash -c "curl -sSL https://get.docker.com/ubuntu/ | sh"': }
}
