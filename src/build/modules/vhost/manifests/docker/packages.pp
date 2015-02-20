class vhost::docker::packages {
  bash_exec { 'curl -sSL https://get.docker.com/ubuntu/ | sh': }
}
