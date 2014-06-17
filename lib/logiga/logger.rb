module Logiga
  module Logger

    module_function

    def init
      @logger = {}
      yield self
    end

    def clear
      @logger = {}
    end

    def register(type, log_level, log_path, log_filename)
      if log_path.is_a? String
        log_path = Pathname.new(log_path)
      end
      FileUtils.mkdir_p log_path
      @logger[type] = LogigaLogger.new(log_path.join(log_filename))
    end

    def record(type, level, message)
      logger_for(type).info(message.to_json)
    end

    def logger_for(type)
      @logger[type]
    end
  end
end
