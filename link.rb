#!/usr/bin/env ruby
# frozen_string_literal: true

require "bundler/inline"

gemfile do
  source "https://rubygems.org"
  gem "thor"
end

class Link < Thor
  include Thor::Actions

  default_command :link

  def self.exit_on_failure? = true

  desc "link", "Create symlinks for dotfiles in home directory"
  option :dry_run, type: :boolean, default: false, desc: "Show actions without changing the filesystem"
  option :force, type: :boolean, default: false, desc: "Overwrite existing files or symlinks"
  def link
    require "fileutils"
    root = File.join(__dir__, "files")
    process(root, root)
  end

  private

    def process(dir, root)
      same_dir = dir == root

      Dir
        .children(dir)
        .each do |file|

        full_path = File.join(dir, file)

        if File.directory?(full_path)
          process(full_path, root)
          next
        end

        target_file =
          same_dir ?
            file :
            dir
              .delete_prefix(root)
              .delete_prefix("/")
              .then { File.join(_1, file) }

        target     = File.join(ENV["HOME"], ".#{target_file}")
        target_dir = File.dirname(target)

        case
        when same_dir
          # No parent directories to create.
        when Dir.exist?(target_dir)
          if options[:dry_run]
            say "Would skip #{target_dir} (already exists)", :yellow
          end
        when options[:dry_run]
          say "Would create directory #{target_dir}", :blue
        else
          FileUtils.mkdir_p(target_dir)
          say "Created directory #{target_dir}", :green
        end

        if File.exist?(target) || File.symlink?(target)
          if options[:dry_run]
            action = options[:force] ? "force remove" : "skip"
            say "Would #{action} #{target} (already exists)", :blue
            next
          end

          unless options[:force]
            say "Skipping #{target} (already exists)", :yellow
            next
          end

          FileUtils.rm_f(target)
          say "Removed #{target}", :yellow
        end

        if options[:dry_run]
          say "Would link #{full_path} -> #{target}", :green
        else
          File.symlink(full_path, target)
          say "Linked #{full_path} -> #{target}", :green
        end
      end
    end
end

Link.start(ARGV)
