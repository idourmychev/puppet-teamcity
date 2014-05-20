class teamcity::user_mgmt {
  group {'agent_group':
    name => $teamcity::agent::username,
    ensure => present
  } ->

  user {'agent_user':
    name => $teamcity::agent::username,
    gid => [$teamcity::agent::username],
    home => "/home/$username",
    managehome => true
  }
}