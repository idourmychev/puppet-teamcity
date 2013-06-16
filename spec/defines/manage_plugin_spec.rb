require 'spec_helper'

describe 'manage_plugin', :type => :define do
    describe 'when installing a teamcity plugin' do

      let(:title) { 'jonnyzzz.node.zip' }

      it { should contain_file('Ensure-jonnyzzz.node.zip-present')}
    end

end
