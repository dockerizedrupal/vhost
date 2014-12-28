class vhost::php::packages {
  package {[
      'php5-fpm'
    ]:
    ensure => present
  }
}
