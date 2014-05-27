class teamcity::agent::config {
  if $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }

  case downcase($::osfamily){
    'debian': {
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
    'windows': {

      exec {'Ensure buildAgent.properties exists':
        command => 'cp buildAgent.dist.properties buildAgent.properties',
        onlyif => "if(Test-Path ${teamcity::agent::destination_dir}/conf/buildAgent.properties) { exit 1 } else { exit 0 }",
        cwd     => "${teamcity::agent::destination_dir}/conf",
        provider => 'powershell'
      } ->

      ini_setting { 'server url':
        ensure            => $ensure,
        section           => '',
        key_val_separator => '=',
        path              => "${teamcity::agent::destination_dir}/conf/buildAgent.properties",
        setting           => 'serverUrl',
        value             => $::teamcity::agent::server_url,
      } ->

      ini_setting { 'agent name':
        ensure             => $ensure,
        section           => '',
        key_val_separator => '=',
        path              => "${teamcity::agent::destination_dir}/conf/buildAgent.properties",
        setting           => 'name',
        value             => $::teamcity::agent::agentname,
      }

    }
  }
}