puts IO.read(File.join(File.dirname(__FILE__), 'README'))

fork do
  load File.join(File.dirname(__FILE__), 'install-process.rb')
end
