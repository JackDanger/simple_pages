
puts "Do you want to use version-control with your pages? (Recommended)"
puts "[y/n]:"
Kernel.system("ruby #{RAILS_ROOT}/script/plugin install -x http://svn.techno-weenie.net/projects/plugins/acts_as_versioned") unless Kernel.gets.chomp.downcase == 'n'
