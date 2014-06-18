require 'loggers/file_logger'
require 'loggers/plain_logger'
require 'loggers/noop_logger'

require 'logiga/version'

module Logiga
  module_function

  def init
    @logger = {}
    yield self
  end

  def clear
    @logger = {}
  end

  def register(id)
    @logger[id] = yield
  end

  def log(id, message, level=:info)
    logger_for(id).send(level, message)
  end

  def logger_for(id)
    @logger[id]
  end
end
