require 'logger'

# Log to text file with plain format.
module Logiga
  class PlainFileLogger < FileLogger
    include Logiga::Formatters::PlainFormatter
  end
end
