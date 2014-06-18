module Logiga
  module Formatters
    module PlainFormatter
      def format_message(severity, timestamp, progname, msg)
        "#{msg}\n"
      end
    end
  end
end
