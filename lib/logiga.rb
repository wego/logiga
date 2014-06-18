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

  def for(id)
    @loggers[id.to_sym]
  end

  def register(id, logger)
    @loggers[id.to_sym] = logger
  end
end
