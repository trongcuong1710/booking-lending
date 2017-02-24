require 'nokogiri'
require 'fileutils'
require 'optparse'

options = {}

optparse = OptionParser.new do |opts|
  opts.banner = "Usage: plist_generator.ruby [options] [arguments]"
  opts.separator ""
  opts.separator "Required options:"

  opts.on("-i", "--bundle_identifier BUNDLE", "Bundle Identifier") do |bundle|
    options[:bundle_identifier] = bundle
  end

  opts.on("-b", "--build_version VERSION", "Build Version") do |version| 
    options[:build_version] = version
  end

  opts.on("-o", "--output_file OUTPUT", "Full path to output file") do |output|
    options[:output_file] = output
  end

  opts.on("-u", "--url URL", "URL to ipa file") do |url|
    options[:url] = url
  end

  opts.on("-n", "--name NAME", "App name") do |name|
    options[:name] = name
  end
end

begin
  optparse.parse!
  mandatory = [:bundle_identifier, :build_version, :output_file, :url, :name]
  missing = mandatory.select{ |param| options[param].nil? }
  unless missing.empty?
    raise OptionParser::MissingArgument.new(missing.join(', '))
  end
rescue OptionParser::InvalidOption, OptionParser::MissingArgument
  puts $!.to_s
  puts optparse
  exit
end

builder = Nokogiri::XML::Builder.new do |xml|
  xml.doc.create_internal_subset(
    'plist',
    "-//Apple//DTD PLIST 1.0//EN",
    "http://www.apple.com/DTDs/PropertyList-1.0.dtd")

  xml.plist('version' => '1.0') do
    xml.dict {
      xml.key "items"
      xml.array {
        xml.dict {
          xml.key "assets"
          xml.array {
            xml.dict {
              xml.key "kind"
              xml.string "software-package"
              xml.key "url"
              xml.string options[:url]
          }
        }
          xml.key "metadata"
          xml.dict {
            xml.key "bundle-identifier"
            xml.string options[:bundle_identifier]
            xml.key "bundle-version"
            xml.string options[:build_version]
            xml.key "kind"
            xml.string "software"
            xml.key "title"
            xml.string options[:name]
          }
        }
      }
    }
  end
end

# Create directory if not exist
puts "Attempt to create plist file at" + options[:output_file].to_s
dirname = File.dirname(options[:output_file].to_s)
unless File.directory?(dirname)
  FileUtils.mkdir_p(dirname)
end

output_file = File.new(options[:output_file].to_s, "w+")
output_file.puts builder.to_xml
output_file.close
