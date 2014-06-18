require 'logiga/version'

require 'logiga/formatters/json_formatter'
require 'logiga/formatters/plain_formatter'

require 'logiga/file_logger'
require 'logiga/json_file_logger'
require 'logiga/plain_file_logger'
require 'logiga/noop_logger'

module Logiga
  module_function

  def init
    @loggers = {}
    yield self
  end

  def clear
    @loggers = {}
  end

  def register(id, logger)
    id = id.to_sym
    raise ArgumentError.new("Duplicate logger id for #{id}") if @loggers[id]

    @loggers[id] = logger

    module_eval <<-EVAL, __FILE__, __LINE__ + 1
      def #{id}_logger
        @loggers[:#{id}]
      end
      module_function :#{id}_logger
    EVAL
  end
end
