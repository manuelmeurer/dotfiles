begin
  require 'amazing_print'
rescue LoadError => e
  warn "Couldn't load amazing_print: #{e}"
else
  Pry.config.print = ->(output, value, _) do
    output.puts value.ai
    output.puts
  end
end

Pry.config.prompt_name = if defined?(Rails)
  app_class = Rails.application.class
  # DEPRECATION WARNING: `Module#parent_name` has been renamed to `module_parent_name`. `parent_name` is deprecated and will be removed in Rails 6.1.
  app_name = app_class.respond_to?(:module_parent_name) ? app_class.module_parent_name : app_class.parent_name
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

extend Rails::ConsoleMethods if defined?(Rails::ConsoleMethods) && Rails.env.present?
