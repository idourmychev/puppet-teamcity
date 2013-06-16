define teamcity::plugin($plugin = $title, $data_directory, $restart) {

  file { "Ensure-${plugin}-present":
    ensure  => file,
    path    => "${data_directory}/plugins/${plugin}",
    source  => "puppet:///modules/teamcity_plugins/${plugin}",
    #notify  => Exec['restart_teamcity'],
  }

}
