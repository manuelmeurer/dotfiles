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

begin
  require 'awesome_print'
  AwesomePrint.irb!
rescue LoadError => e
  warn "Couldn't load awesome_print: #{e}"
end

# Set Rails logger
ActiveRecord::Base.logger = Logger.new(STDOUT) if defined?(ActiveRecord)
if defined?(Rails)
  unless Object.const_defined?('RAILS_DEFAULT_LOGGER')
    require 'logger'
    RAILS_DEFAULT_LOGGER = Logger.new(STDOUT)
  end
end
