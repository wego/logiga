require 'logger'

# Log to text file. Create the folder as well.
module Logiga
  class FileLogger < ::Logger
    def initialize(filename, shift_age = 0, shift_size = 1048576)
      filepath_str = File.expand_path(filename)
      filedir_str = File.dirname(filepath_str)
      Pathname.new(filedir_str).mkpath()

      super(filename, shift_age, shift_size)
    end
  end
end
