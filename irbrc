require 'rubygems' unless defined?(Gem)

# IRB completion and history

require 'irb/completion'
require 'irb/ext/save-history'

IRB.conf[:HISTORY_FILE] = [ENV['HOME'], '.irb-history'].join('/')
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:AUTO_INDENT]  = true

# Break out of the Bundler jail
# from https://github.com/ConradIrwin/pry-debundle/blob/master/lib/pry-debundle.rb
if defined?(Bundler)
  Gem.post_reset_hooks.reject! { |hook| hook.source_location.first =~ %r{/bundler/} }
  Gem::Specification.reset
  load 'rubygems/custom_require.rb'
end

%w(wirble hirb pp awesome_print looksee).each do |lib|
  begin
    require lib
  rescue LoadError => e
    warn "Couldn't load lib #{lib}: #{e}"
  end
end

# Looksee

if defined?(Looksee)
  Looksee.editor = 'mate -l%l %f'
end

# Wirble

if defined?(Wirble)
  Wirble.init \
    history_path: IRB.conf[:HISTORY_FILE],
    history_size: IRB.conf[:SAVE_HISTORY],
    init_colors:  true
end

# Hirb

if defined?(Hirb)
  Hirb.enable
end

# Set Rails logger

if defined?(ActiveRecord)
  ActiveRecord::Base.logger = Logger.new(STDOUT)
end

if defined?(Rails)
  unless Object.const_defined?('RAILS_DEFAULT_LOGGER')
    require 'logger'

    RAILS_DEFAULT_LOGGER = Logger.new(STDOUT)
  end
end

# Set IRB prompt

if defined?(Rails)
  rvm_prompt = IRB.conf[:PROMPT][:RVM]

  unless rvm_prompt.nil?
    default_prompt = "#{Rails.application.class.parent_name} (#{Rails.env})"

    IRB.conf[:PROMPT].reverse_merge!(
      RVM_WITH_CURRENT_APP: {
        PROMPT_I:    "#{default_prompt} #{rvm_prompt[:PROMPT_I]}",
        PROMPT_N:    "#{default_prompt} #{rvm_prompt[:PROMPT_N]}",
        PROMPT_S:    "#{default_prompt} #{rvm_prompt[:PROMPT_S]}",
        PROMPT_C:    "#{default_prompt} #{rvm_prompt[:PROMPT_C]}",
        RETURN:      rvm_prompt[:RETURN],
        AUTO_INDENT: true
      }
    )

    IRB.conf[:PROMPT_MODE] = :RVM_WITH_CURRENT_APP
  end
end
