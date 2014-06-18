require 'logger'

# Plain text logging without any fluff
class PlainLogger < ::Logger
  def format_message(severity, timestamp, progname, msg)
    "#{msg}\n"
  end
end
