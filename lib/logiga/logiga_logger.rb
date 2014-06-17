require 'logger'

class LogigaLogger < ::Logger
  def format_message(severity, timestamp, progname, msg)
    "#{msg}\n" # Just the message here so that it's easy for fluentd to parse
  end
end
