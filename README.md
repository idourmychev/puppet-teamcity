Puppet-TeamCity
==

Module for Puppet that will manage pieces of the TeamCity CI server. 

Usage
--

To use the module, use git clone to a directory in your modules folder on your puppetmaster. Then create a module manifest for the teamcity configuration you wish to maintain. Then you need to include this new module manifest in your nodes.pp file as follows:

    node 'myteamcitynode' {
        include 'myteamcity'
    }
    
Please note, that you need to implement the teamcity class in your module as in the example below. You will also have to upload your teamcity plugins to the files folder of the module

Examples
--  

    class myteamcity {
        $teamcity_data_directory = 'c:/temp'

        teamcity::manage_plugin {'jonnyzzz.node.zip':
            data_directory => $teamcity_data_directory,
        }

        teamcity::manage_plugin {'another.plugin.zip':
            data_directory => $teamcity_data_directory,
            restart        => true,
        }

    }
