class vhost::dns::packages {
  exec { '/bin/su - root -c "curl -sL https://deb.nodesource.com/setup | bash -"': }

  package {[
      'nodejs'
    ]:
    ensure => present,
    require => Exec['/bin/su - root -c "curl -sL https://deb.nodesource.com/setup | bash -"']
  }
}
