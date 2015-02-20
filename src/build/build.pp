node default {
  include vhost
  include vhost::docker
  include vhost::fig
  include vhost::jq
  include vhost::composer
}
