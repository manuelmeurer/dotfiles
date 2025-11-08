#!/usr/bin/env ruby

require "fileutils"

def process(dir)
  same_dir = dir == __dir__

  Dir.children(dir).each do |file|
    next if
      (same_dir && file == File.basename(__FILE__)) ||
      file.end_with?(".code-workspace") ||
      file[0] == "."

    if File.directory?(file)
      process File.join(dir, file)
      next
    end

    target_file =
      same_dir ?
        file :
        dir
          .delete_prefix(__dir__)
          .delete_prefix("/")
          .then { File.join _1, file }

    target = File.join(ENV["HOME"], ".#{target_file}")

    unless same_dir
      FileUtils.mkdir_p(File.dirname(target))
    end

    next if File.exist?(target)

    source = File.join(dir, file)

    File.symlink(source, target)

    puts "Linked #{source} -> #{target}"
  end
end

process __dir__
