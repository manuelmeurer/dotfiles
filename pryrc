begin
  require 'amazing_print'
rescue LoadError => error
  warn "Couldn't load amazing_print: #{error}"
else
  Pry.config.print = ->(output, value, _) do
    output.puts value.ai
    output.puts
  end
end

Pry.config.prompt_name = if defined?(Rails)
  app_name = Rails.application.class.module_parent_name
  case Rails.env
  when 'development'
    Pry::Helpers::Text.green("#{app_name} DEV")
  when 'test'
    Pry::Helpers::Text.blue("#{app_name} TEST")
  when 'production'
    Pry::Helpers::Text.red("#{app_name} PROD")
  else
    Pry::Helpers::Text.cyan("#{app_name} #{Rails.env.upcase}")
  end
else
  File.basename(Dir.pwd)
end

Pry.config.exception_handler = ->(output, exception, _pry_) do
  exceptions = [exception]
  while exception.respond_to?(:cause) && !exception.cause.nil?
    exceptions << exception.cause
    exception = exception.cause
  end
  exceptions.each do |exception|
    default_exception_message = "#{exception.class}: #{exception.message}"
    exception_message, backtrace = if exception == exceptions.first
      [
        default_exception_message,
        exception.backtrace.take(10)
      ]
    else
      [
        "caused by: #{default_exception_message}",
        exception.backtrace
      ]
    end
    output.puts exception_message
    backtrace.each do |line|
      output.puts "  #{line}"
    end
  end
  _pry_.run_command 'cat --ex'
  output.puts
end

if defined?(Rails::ConsoleMethods) && Rails.env.present?
  extend Rails::ConsoleMethods
end

if ENV["RENDER"] && cache_folder = ENV["XDG_CACHE_HOME"]
  Pry.config.history_file = File.join(cache_folder, "pry_history")
end
