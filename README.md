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

Plugin Storage
--

Create a files folder in the teamcity folder you forked. Upload your plugins in this folder, this will mean that the puppetmaster can use the files from the local storage

Dependencies
--
The agent subclass depends on augeas. The original should work but it has an outdated stdlib dependency that needed to be upgraded for our use.
https://github.com/opentable/puppet-augeas/releases/tag/v0.0.2
