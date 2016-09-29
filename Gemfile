# A sample Gemfile
source 'http://rubygems.org'

if RUBY_VERSION =~ /^1\./
  gem 'rake', '10.5.0' # still supports 1.8
  gem 'rspec-core', '= 3.1.7'
else
  gem 'rake'
end

if RUBY_VERSION =~ /^1\.9/
  gem 'json_pure', '<=2.0.1'
  # rubocop 0.42.0 requires ruby >=2; 1.8 is not supported
  gem 'rubocop', '0.41.2' if RUBY_VERSION =~ /^1\.9/
elsif RUBY_VERSION =~ /^1\.8/
  gem 'json_pure', '< 2.0.0'
else
  gem 'rubocop'
  gem 'rubocop-rspec', '~> 1.6' if RUBY_VERSION >= '2.3.0'
end

gem 'puppet-lint', :git => 'https://github.com/rodjek/puppet-lint.git'
gem 'rspec-puppet', :git => 'https://github.com/rodjek/rspec-puppet.git'
gem 'puppet', '>= 3.3.0', '< 4.0.0'
gem 'puppetlabs_spec_helper', '0.4.1'
