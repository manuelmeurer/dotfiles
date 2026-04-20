#!/usr/bin/env ruby
# frozen_string_literal: true

require "json"

RM_RF_PATTERN = /(^|[;&|]\s*)\s*(?:sudo\s+)?(?:command\s+)?rm\s+-(?:rf|fr)\b/

begin
  input = JSON.parse($stdin.read)
rescue JSON::ParserError => e
  warn "Error: Invalid JSON input: #{e.message}"
  exit 1
end

exit 0 unless input["tool_name"] == "Bash"

command = input.dig("tool_input", "command").to_s

if RM_RF_PATTERN.match?(command)
  warn "Refusing to run `rm -rf`. Use `trash` instead."
  exit 2
end
