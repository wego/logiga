require 'logger'

# Logger which doesn't actually log anywhere. Useful for testing.
# May not work on Windows, but let's keep it a secret
class NoopLogger < ::Logger
  def initialize(name, shift_age = 7, shift_size = 1048576)
    super('/dev/null')
  end
end
