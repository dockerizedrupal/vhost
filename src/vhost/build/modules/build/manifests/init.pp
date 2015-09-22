class build {
  include build::nginx
  include build::php
  include build::dockergen
  include build::vhost
}
