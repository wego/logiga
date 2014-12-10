require 'syslog/logger'

module Logiga
  class SyslogLogger < ::Syslog::Logger
    def initialize(program, facility = nil)
      super(program,facility)
    end
  end
end
