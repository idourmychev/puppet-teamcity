require 'spec_helper'

describe 'teamcity::manage_plugin', :type => :define do

    describe 'when installing the jonnyzzz.node plugin' do

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


    end

    describe 'when trying to install a module with no name' do

      let(:title) {''}
      let(:params ) {
        { :data_directory => 'c:/temp',
          :restart => false
        }
      }

      it { expect { should contain_file('Ensure--present') }.to raise_error(Puppet::Error, /Plugin name must not be empty/) }

    end

end
