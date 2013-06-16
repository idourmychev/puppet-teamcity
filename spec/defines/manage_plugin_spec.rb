require 'spec_helper'

describe 'teamcity::manage_plugin', :type => :define do
    describe 'when installing the jonnyzzz.node plugin' do

      let(:title) { 'jonnyzzz.node.zip' }
      let(:data_directory) { 'c:/temp' }

      it { should contain_file('Ensure-jonnyzzz.node.zip-present').with( {
         :path  => 'c:/temp/plugins/jonnyzzz.node.zip',})
      }

    end

end
