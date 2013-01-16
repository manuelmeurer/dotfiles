begin
  require 'awesome_print'
  Pry.config.print = ->(output, value) { output.puts value.ai }
rescue LoadError => e
  warn "Couldn't load awesome_print: #{e}"
end

Pry.config.prompt_name = File.basename(Dir.pwd)

extend Rails::ConsoleMethods if defined?(Rails) && Rails.env.present?
