# Break out of the Bundler jail
# from https://github.com/ConradIrwin/pry-debundle/blob/master/lib/pry-debundle.rb
if defined?(Bundler)
  Gem.post_reset_hooks.reject! { |hook| hook.source_location.first =~ %r(/bundler/) }
  Gem::Specification.reset
  load 'rubygems/custom_require.rb'
end

# Try to load Pry instead of IRB
begin
  require 'pry'
  Pry.start
  exit
rescue LoadError => e
  warn "Couldn't load pry: #{e}"
end

# IRB completion and history
require 'irb/completion'
require 'irb/ext/save-history'

IRB.conf[:HISTORY_FILE] = [ENV['HOME'], '.irb-history'].join('/')
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:AUTO_INDENT]  = true

%w(pp awesome_print).each do |lib|
  begin
    require lib
  rescue LoadError => e
    warn "Couldn't load lib #{lib}: #{e}"
  end
end

# Set Rails logger
ActiveRecord::Base.logger = Logger.new(STDOUT) if defined?(ActiveRecord)
if defined?(Rails)
  unless Object.const_defined?('RAILS_DEFAULT_LOGGER')
    require 'logger'
    RAILS_DEFAULT_LOGGER = Logger.new(STDOUT)
  end
end
