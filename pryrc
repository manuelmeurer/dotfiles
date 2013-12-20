begin
  require 'awesome_print'
  Pry.config.print = ->(output, value) do
    output.puts value.ai
    output.puts
  end
rescue LoadError => e
  warn "Couldn't load awesome_print: #{e}"
end

# begin
#   require 'pry-debugger'
#   commands = {
#     c: 'continue',
#     s: 'step',
#     n: 'next',
#     f: 'finish'
#   }
#   commands.each do |shortcut, command|
#     Pry.commands.alias_command shortcut, command
#   end
# rescue LoadError => e
#   warn "Couldn't load pry-debugger: #{e}"
# end

Pry.config.prompt_name = File.basename(Dir.pwd)

Pry.config.exception_handler = ->(output, exception, _pry_) do
  output.puts exception
  output.puts exception.backtrace.first(10)
  _pry_.run_command 'cat --ex'
  output.puts
end

extend Rails::ConsoleMethods if defined?(Rails) && Rails.env.present?
