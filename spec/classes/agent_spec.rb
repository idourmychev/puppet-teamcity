require 'spec_helper'

describe 'teamcity::agent', :type => :class do

  let(:facts) { {
      :osfamily  => 'Debian'
  } }
  let(:params) {{
      :agentname       => 'test-agent-1',
      :username        => 'teamcity',
      :server_url      => 'http://10.10.21.42',
      :archive_name    => 'buildAgent.zip',
      :agent_dir       => 'build-agent',
      :destination_dir => '/var/tainted',
      :priority        => '20'
  }}

  it { should compile.with_all_deps }

  it { should contain_class('teamcity::user_mgmt').that_comes_before('teamcity::agent::install') }
  it { should contain_class('teamcity::agent::install').that_comes_before('teamcity::agent::config') }
  it { should contain_class('teamcity::agent::config').that_comes_before('teamcity::agent::service')}

  context 'using params defaults the install class' do
    it { should contain_class('teamcity::agent::install') }

    it { should contain_package('unzip', 'default-jre')
      .with_ensure('installed')
    }

    it { should contain_file('agent_home')
      .with_ensure('directory')
      .with_path('/home/teamcity')
      .with_group('teamcity')
      .with_owner('teamcity')
    }

    it { should contain_wget__fetch('teamcity-buildagent')
      .with_source('http://10.10.21.42/update/buildAgent.zip')
      .with_destination('/root/buildAgent.zip')
      .with_timeout('0')
    }

    it { should contain_file('/var/tainted')
      .with_ensure('directory')
    }

    it { should contain_exec('extract-build-agent')
      .with_command('unzip -d /var/tainted/build-agent /root/buildAgent.zip && cp /var/tainted/build-agent/conf/buildAgent.dist.properties /var/tainted/build-agent/conf/buildAgent.properties && chown teamcity:teamcity /var/tainted/build-agent -R')
      .with_path('/usr/bin:/usr/sbin:/bin:/usr/local/bin:/opt/local/bin')
      .with_creates('/var/tainted/build-agent')
      .with_logoutput('on_failure')
    }

    it { should contain_file('/var/tainted/build-agent/bin/')
      .with_mode('755')
      .with_recurse('true')
    }
  end


end