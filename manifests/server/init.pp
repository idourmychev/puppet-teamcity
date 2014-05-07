class teamcity::server {
class {'teamcity::server::install': } ->
class {'teamcity::server::config': } ->
class {'teamcity::server::service': } ->
Class['teamcity::server']
}