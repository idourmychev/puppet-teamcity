require 'spec_helper'

describe 'teamcity_plugins', :type => :class do
    describe 'when installing a teamcity plugin' do
        it { should contain_exec('restart_teamcity')}
    end

end
