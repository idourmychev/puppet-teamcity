class teamcity::user_mgmt {
  if downcase($::osfamily) == 'debian' {
    group { 'agent_group':
      ensure => present,
      name   => $teamcity::agent::username,
    } ->

    user { 'agent_user':
      name => $teamcity::agent::username,
      gid  => [ $teamcity::agent::username ],
      home => "/home/${teamcity::agent::username}",
    }
  }
}
