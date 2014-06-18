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
    @loggers[id] = logger
  end

  def log(id, message, level = :info)
    @loggers[id].send(level, message)
  end

  def logger_for(id)
    @loggers[id]
  end
end
