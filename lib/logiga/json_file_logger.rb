require 'logger'

# Log to text file with json format.
module Logiga
  class JsonFileLogger < FileLogger
    include Logiga::Formatters::JsonFormatter
  end
end
