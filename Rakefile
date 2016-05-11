require "bundler/gem_tasks"
task :default => :spec

desc 'Update Cache'
task :update_cache do
  require 'yaml'

  codes = YAML.load_file(File.join(File.dirname(__FILE__), 'lib', 'country_list', 'country_data', 'country_codes.yaml')) || {}
  data = {}

  codes.each do |code|
    data[code] ||= YAML.load_file(File.join(File.dirname(__FILE__), 'lib', 'country_list', 'country_data', 'countries', "#{code}.yaml"))[code]
  end

  File.open(File.join(File.dirname(__FILE__), 'lib', 'country_list', 'cache', 'countries'), 'wb') { |f| f.write(Marshal.dump(data)) }
end
