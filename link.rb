Dir['*'].each do |f|
  next if f =~ /\.tmproj$/

  file    = File.expand_path("./#{f}")
  dotfile = File.expand_path("~/.#{f}")

  if File.exists?(dotfile) || File.symlink?(dotfile)
    print "File #{dotfile} already exists. Overwrite? (yN) "
    next unless gets == "y\n"
    File.delete(dotfile)
  end

  %x(ln -s #{file} #{dotfile})
end
