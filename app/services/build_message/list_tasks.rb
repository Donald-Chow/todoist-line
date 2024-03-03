module BuildMessage
  class ListTasks < ApplicationService
    def initialize(attr = {})
      @tasks = attr[:tasks]
      super()
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
  end
end
