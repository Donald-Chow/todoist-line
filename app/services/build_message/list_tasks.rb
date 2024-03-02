module BuildMessage
  class ListTasks
    def initialize(attr = {})
      @tasks = attr[:tasks]
    end

    def call
      tasks = @tasks.map.with_index do |task, index|
        "#{index + 1} - #{task['content']}"
      end

      <<~MESSAGE
        -- Your Tasks --
        #{tasks.join("\n")}
      MESSAGE
    end

    def self.call(*args, &block)
      new(*args, &block).call
    end
  end
end
