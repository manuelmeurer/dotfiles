# Try to load Pry instead of IRB
begin
  require 'pry'
rescue LoadError => e
  warn "Couldn't load pry: #{e}"
else
  Pry.start
  exit
end

# IRB completion and history
require 'irb/completion'
require 'irb/ext/save-history'

IRB.conf[:HISTORY_FILE] = [ENV['HOME'], '.irb-history'].join('/')
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:AUTO_INDENT]  = true

begin
  require 'amazing_print'
rescue LoadError => e
  warn "Couldn't load amazing_print: #{e}"
else
  AmazingPrint.irb!
end

# Set Rails logger
ActiveRecord::Base.logger = Logger.new(STDOUT) if defined?(ActiveRecord)
if defined?(Rails) && !Object.const_defined?('RAILS_DEFAULT_LOGGER')
  require 'logger'
  RAILS_DEFAULT_LOGGER = Logger.new(STDOUT)
end
