begin
  require 'awesome_print'
  AwesomePrint.pry!
rescue LoadError => e
  warn "Couldn't load awesome_print: #{e}"
end

Pry.config.prompt_name = File.basename(Dir.pwd)

extend Rails::ConsoleMethods if defined?(Rails) && Rails.env.present?
