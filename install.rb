puts IO.read(File.join(File.dirname(__FILE__), 'README'))


puts "If you want to use version-control with your pages you'll need to run the following command to install Techno-Weenie's ActsAsVersioned plugin (highly recommended)"
puts "Just copy and past the following into your shell:"
puts ''
puts "    ruby #{RAILS_ROOT}/script/plugin install -x http://svn.techno-weenie.net/projects/plugins/acts_as_versioned"
puts ''

unless File.exists?("#{RAILS_ROOT}/vendor/plugins/engines")
  puts "WARNING: you do not have the engines plugin installed.  This is a necessary requirement for the simple_pages plugin to work."
  puts "Please install the engines plugin by running the following command in your shell:"
  puts ''
  puts "    ruby #{RAILS_ROOT}/script/plugin install -x http://svn.rails-engines.org/plugins/engines"
  puts ''
end
