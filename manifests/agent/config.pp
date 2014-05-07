class teamcity::agent::config {
  if $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }

  file { "properties.aug":
    ensure  => "present",
    path    => "/usr/share/augeas/lenses/dist/properties.aug",
    content => template("${module_name}/properties.aug.erb"),
  } ->

  augeas { "buildAgent.properties":
    lens    => "Properties.lns",
    incl    => "${teamcity::agent::destination_dir}/${teamcity::agent::agent_dir}/conf/buildAgent.properties",
    changes => [
    "set name ${teamcity::agent::agentname}",
    "set serverUrl ${teamcity::agent::server_url}",
    ]
  }
}