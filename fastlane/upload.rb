require 'nokogiri'
require 'fileutils'
require 'optparse'
require 'net/sftp'

options = {:hostname => "128.199.238.128", :user => "webapp"}

optparse = OptionParser.new do |opts|
  opts.banner = "Usage: upload.rb [options] [arguments]"
  opts.separator ""
  opts.separator "Required options:"

  opts.on("-h", "--hostname HOSTNAME", "Host name") do |hostname|
    options[:hostname] = hostname
  end

  opts.on("-u", "--user USER", "User") do |user| 
    options[:user] = user
  end

  opts.on("-l", "--local_file LOCAL", "Full path to local file") do |local|
    options[:local_file] = local
  end

  opts.on("-r", "--remote_file REMOTE", "Full path to remote file") do |remote|
    options[:remote_file] = remote
  end

  opts.on("-n", "--name NAME", "App name") do |name|
    options[:name] = name
  end
end

begin
  optparse.parse!
  mandatory = [:local_file, :remote_file]
  missing = mandatory.select{ |param| options[param].nil? }
  unless missing.empty?
    raise OptionParser::MissingArgument.new(missing.join(', '))
  end
rescue OptionParser::InvalidOption, OptionParser::MissingArgument
  puts $!.to_s
  puts optparse
  exit
end

Net::SFTP.start(options[:hostname], options[:user]) do |sftp|
  # upload a file or directory to the remote host
  sftp.upload!(options[:local_file], options[:remote_file])
end