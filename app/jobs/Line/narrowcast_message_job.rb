module Line
  class NarrowcastMessageJob < ApplicationJob
    queue_as :default
    def perform(*args)

    end
  end
end
