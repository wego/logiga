require 'logger'

# Logger which doesn't actually log anywhere. Useful for testing.
# May not work on Windows, but let's keep it a secret
module Logiga
  class NoopLogger < ::Logger
    def initialize
      super('/dev/null')
    end
  end
end
