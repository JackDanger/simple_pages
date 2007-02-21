puts IO.read(File.join(File.dirname(__FILE__), 'README'))

cmd = "ruby #{File.join(File.dirname(__FILE__), 'install-process.rb')}"
p cmd
system(cmd)
