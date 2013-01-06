begin
  require 'awesome_print'
  Pry.config.print = ->(output, value) { output.puts value.ai }
rescue LoadError => e
  warn "Couldn't load awesome_print: #{e}"
end
