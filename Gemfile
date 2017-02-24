source "https://rubygems.org"

gem 'fastlane'
gem 'scan'
gem 'xcov'
gem 'gym'
gem 'cocoapods', '1.1.1'
gem 'nokogiri'

plugins_path = File.join(File.dirname(__FILE__), 'fastlane', 'Pluginfile')
eval(File.read(plugins_path), binding) if File.exist?(plugins_path)
