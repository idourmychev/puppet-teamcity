class teamcity_plugins {
  $teamcity_data_directory = ''

  file { "data-directory-${$teamcity_data_directory}":
    ensure => directory,
  }

  file { 'TeamCity.Node':
    ensure  => file,
    path    => "${$teamcity_data_directory}/plugins/jonnyzzz.node.zip",
    source  => 'puppet:///modules/teamcity_plugins/jonnyzzz.node.zip',
    require => File["data-directory-${$teamcity_data_directory}"],
    notify  => Exec['restart_teamcity'],
  }

  exec { 'restart_teamcity':
    command     => 'command to restart the service',
    refreshonly => true,
  }
}