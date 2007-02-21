puts IO.read(File.join(File.dirname(__FILE__), 'README'))

fork do
  pfile = File.join(File.dirname(__FILE__), 'install-process.rb')
  puts pfile
  load pfile
end
