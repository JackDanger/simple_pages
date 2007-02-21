puts IO.read(File.join(File.dirname(__FILE__), 'README'))

system('ruby '+(File.join(File.dirname(__FILE__), 'install-process.rb')))
