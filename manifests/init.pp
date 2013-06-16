class teamcity {

$teamcity_data_directory = "c:/temp"

  manage_plugin {"jonnyzzz.node.zip":
    data_directory => $teamcity_data_directory,
  }

  manage_plugin {"another.plugin.zip":
    data_directory => $teamcity_data_directory,
    restart        => true
  }

}