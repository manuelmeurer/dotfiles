#!/usr/bin/env ruby

def process(dir)
  Dir.children(dir).each do |file|
    next if
      (dir == __dir__ && file == File.basename(__FILE__)) ||
      file.end_with?(".code-workspace") ||
      file[0] == "."

    if File.directory?(file)
      process File.join(dir, file)
      next
    end

    target_file =
      dir == __dir__ ?
        file :
        dir
          .delete_prefix(__dir__)
          .delete_prefix("/")
          .then { File.join _1, file }

    target = File.join(ENV["HOME"], ".#{target_file}")

    next if File.exist?(target)

    source = File.join(dir, file)

    File.symlink(source, target)

    puts "Linked #{source} -> #{target}"
  end
end

process __dir__
