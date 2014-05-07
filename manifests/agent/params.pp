class teamcity::agent::params {
  $username = "teamcity"
  $server_url = "http://10.10.21.42"
  $archive_name = "buildAgent.zip"
  $download_url = "$server_url/update/$archive_name"
  $agent_dir = "build-agent"
  $destination_dir = "/var/tainted"
  $priority = "20"
  $teamcity_agent_mem_opts = "-Xms2048m -Xmx2048m -XX:+HeapDumpOnOutOfMemoryError"
}