define teamcity::manage_plugin($plugin = $title, $data_directory, $restart = false) {

  validate_bool($restart)
  validate_string($plugin)
  validate_re($plugin,['^(.)+$'], 'plugin name must not be empty')

  file { "Ensure-${plugin}-present":
    ensure  => file,
    path    => "${data_directory}/plugins/${plugin}",
    source  => "puppet:///modules/teamcity/${plugin}",
  }

}
