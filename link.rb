#!/usr/bin/env ruby

ignore = [
  File.basename(__FILE__)
]

Dir['*'].each do |f|
  next if ignore.any? { |i| i === f }

  file    = File.expand_path("./#{f}")
  dotfile = File.expand_path("~/.#{f}")

  if File.exists?(dotfile) || File.symlink?(dotfile)
    print "File #{dotfile} already exists. Overwrite? (yN) "
    next unless gets.chomp == "y"
    File.delete(dotfile)
  end

  %x(ln -s #{file} #{dotfile})
end
