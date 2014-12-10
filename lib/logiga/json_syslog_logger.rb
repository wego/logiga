module Logiga
  class JsonSyslogLogger < SyslogLogger
    include Logiga::Formatters::JsonFormatter
  end
end
