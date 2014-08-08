begin
  require 'awesome_print'
  Pry.config.print = ->(output, value, _) do
    output.puts value.ai
    output.puts
  end
rescue LoadError => e
  warn "Couldn't load awesome_print: #{e}"
end

Pry.config.prompt_name = if defined?(Rails)
  app_name = Rails.application.class.parent_name
  case Rails.env
  when 'development'
    Pry::Helpers::Text.green("#{app_name} DEV")
  when 'test'
    Pry::Helpers::Text.blue("#{app_name} TEST")
  when 'staging'
    Pry::Helpers::Text.cyan("#{app_name} STAG")
  when 'production'
    Pry::Helpers::Text.red("#{app_name} PROD")
  else
    Pry::Helpers::Text.cyan("#{app_name} #{Rails.env.upcase}")
  end
else
  File.basename(Dir.pwd)
end

Pry.config.exception_handler = ->(output, exception, _pry_) do
  output.puts exception
  output.puts exception.backtrace.first(10)
  _pry_.run_command 'cat --ex'
  output.puts
end

extend Rails::ConsoleMethods if defined?(Rails) && Rails.env.present?
