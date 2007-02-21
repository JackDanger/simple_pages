puts IO.read(File.join(File.dirname(__FILE__), 'README'))

p self

puts "Do you want to use version-control with your pages? (Recommended)"
puts "[y/n]:"
system("ruby #{RAILS_ROOT}/script/plugin install -x http://svn.techno-weenie.net/projects/plugins/acts_as_versioned") unless gets.chomp.downcase == 'n'

p ARGV