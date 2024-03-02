module Line
  class BroadcastMessageJob < ApplicationJob
    queue_as :default

    def perform(*args)
      # Do something later
    end
  end

end
