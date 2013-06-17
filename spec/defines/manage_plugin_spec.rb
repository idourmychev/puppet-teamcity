require 'spec_helper'

describe 'teamcity::manage_plugin', :type => :define do

    describe 'when installing the jonnyzzz.node plugin with a false restart' do

      let(:title) { 'jonnyzzz.node.zip' }
      let(:params ) {
        { :data_directory => 'c:/temp',
          :restart => false
        }
      }

      it { should contain_file('Ensure-jonnyzzz.node.zip-present').with( {
         :path  => 'c:/temp/plugins/jonnyzzz.node.zip',
         :source => 'puppet:///modules/teamcity/jonnyzzz.node.zip',})
      }

      it {should contain_exec('notify-about-new-plugin-installation-only')}

    end

    describe 'when installing the fake.name plugin with a true restart' do

      let(:title) { 'fake.name.zip' }
      let(:params ) {
        { :data_directory => 'c:/temp',
          :restart => true
        }
      }

      it { should contain_file('Ensure-fake.name.zip-present').with( {
         :path  => 'c:/temp/plugins/fake.name.zip',
         :source => 'puppet:///modules/teamcity/fake.name.zip',})
      }

      it {should contain_exec('restart-teamcity-to-install-fake.name.zip')}

    end

    describe 'when trying to install a module with no name' do

      let(:title) {''}
      let(:params ) {
        { :data_directory => 'c:/temp',
          :restart => false
        }
      }

      it { expect { should contain_file('Ensure-1111-present') }.to raise_error(Puppet::Error, /Plugin name must not be empty/) }

    end

    describe 'when trying to install a module passing an empty data directory' do

      let(:title) {'test.node.zip'}
      let(:params ) {
        { :data_directory => '',
          :restart => false
        }
      }

      it { expect { should contain_file('Ensure-test.node.zip-present') }.to raise_error(Puppet::Error, /Data directory must not be empty/) }

    end

    describe 'when trying to install a module and specifying a restart command that is not a valid boolean' do

      let(:title) { 'jonnyzzz.node.zip' }
      let(:params ) {
        { :data_directory => 'c:/temp',
          :restart => 'no'
        }
      }

      it { expect { should contain_file('Ensure-jonnyzzz.node.zip-present') }.to raise_error(Puppet::Error) }

    end

end
