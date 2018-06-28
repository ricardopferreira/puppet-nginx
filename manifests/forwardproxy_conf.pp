# == Defined type: nginx::forwardproxy_conf
#
# This defined type takes a hash of hashes and turns it into a config file.
#
# === Parameters
#
# See README.md.
#
# === Requires
#
# None
#
# === Examples
#
# See README.md.
#
define nginx::forwardproxy_conf(
    $server_name                    = [$::fqdn],
    $access_log                     = "/var/log/nginx/${title}_access.log",
    $error_log                      = "/var/log/nginx/${title}_error.log warn",
    $dns_server                     = "8.8.8.8",
  ) {

  $conf_template = 'forwardproxy_conf.erb'

  file { "${nginx::vhost_dir}/${title}.conf":
    ensure  => 'file',
    mode    => '0640',
    owner   => 'root',
    group   => 'root',
    content => template("${module_name}/${conf_template}"),
    notify  => Service[$nginx::service_name],
  }
}
