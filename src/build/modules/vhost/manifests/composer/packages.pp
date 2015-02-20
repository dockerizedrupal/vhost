class vhost::composer::packages {
  require vhost::php

  bash_exec { 'curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename composer':
    timeout => 0
  }
}
