puts IO.read(File.join(File.dirname(__FILE__), 'README'))

puts "Do you want to use version-control with your pages? (Recommended)"
puts "[y/n]:"
x = gets.chomp
puts x.inspect
system("ruby #{RAILS_ROOT}/script/plugin install -x http://svn.techno-weenie.net/projects/plugins/acts_as_versioned/") unless gets.chomp.downcase == 'n'

p ARGV