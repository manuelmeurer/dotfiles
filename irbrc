require 'rubygems' unless defined?(Gem)

require 'irb/completion'
require 'irb/ext/save-history'

IRB.conf[:HISTORY_FILE] = [ENV['HOME'], '.irb-history'].join('/')
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:AUTO_INDENT]  = true

require 'bundler'

begin
  Bundler.require :console
rescue Bundler::GemfileNotFound
  %w(rubygems wirble hirb pp awesome_print).each do |lib|
    begin
      require lib
    rescue LoadError => e
      warn "Couldn't load lib #{lib}: #{e}"
    end
  end
end

if defined?(Wirble)
  Wirble.init(
    :history_path => IRB.conf[:HISTORY_FILE],
    :history_size => IRB.conf[:SAVE_HISTORY],
    :init_colors  => true
  )
end

if defined?(Hirb)
  Hirb.enable
end

if defined?(ActiveRecord)
  ActiveRecord::Base.logger = Logger.new(STDOUT)
end

if defined?(Rails)
  unless Object.const_defined?('RAILS_DEFAULT_LOGGER')
    require 'logger'

    RAILS_DEFAULT_LOGGER = Logger.new(STDOUT)
  end

  current_app = Dir.pwd.match(/apps\/([^\/]+)/)[1]

  IRB.conf[:PROMPT].reverse_merge!(
    :RVM_WITH_CURRENT_APP => {
      :PROMPT_I    => "#{current_app} #{IRB.conf[:PROMPT][:RVM][:PROMPT_I]}",
      :PROMPT_N    => "#{current_app} #{IRB.conf[:PROMPT][:RVM][:PROMPT_N]}",
      :PROMPT_S    => "#{current_app} #{IRB.conf[:PROMPT][:RVM][:PROMPT_S]}",
      :PROMPT_C    => "#{current_app} #{IRB.conf[:PROMPT][:RVM][:PROMPT_C]}",
      :RETURN      => IRB.conf[:PROMPT][:RVM][:RETURN],
      :AUTO_INDENT => true
    }
  )

  IRB.conf[:PROMPT_MODE] = :RVM_WITH_CURRENT_APP
end
