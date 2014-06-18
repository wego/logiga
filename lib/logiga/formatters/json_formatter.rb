module Logiga
  module Formatters
    module JsonFormatter
      def format_message(severity, timestamp, progname, msg)
        "#{msg.to_json}\n"
      end
    end
  end
end
