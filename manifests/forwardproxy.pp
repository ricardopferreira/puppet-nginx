# == Class: nginx::forwardproxy
#
# See README.md.
#
#
class nginx::forwardproxy inherits nginx {
  if $::nginx::forwardproxy != 'undef' {
    create_resources(nginx::forwardproxy_conf,
      hiera_hash('nginx::forwardproxy', undef)
    )
  }
}
