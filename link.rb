#!/usr/bin/env ruby

require 'fileutils'

ignore = [
  /^#{File.basename(__FILE__)}$/,
  /\.sublime-/
]

Dir['*'].each do |f|
  next if ignore.any? { |i| i =~ f }

  file    = File.expand_path("./#{f}")
  dotfile = File.expand_path("~/.#{f}")

  if File.exists?(dotfile) || File.symlink?(dotfile)
    next if !ENV['SKIP_EXISTING'].nil? && ENV['SKIP_EXISTING'].downcase.strip == 'true'
    print "File #{dotfile} already exists. Overwrite? (yN) "
    next unless gets.chomp == "y"
    File.delete(dotfile)
  end

  FileUtils.ln_s file, dotfile
end
