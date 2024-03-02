module Line
  class MulticastMessageJob < ApplicationJob
    queue_as :default

    def perform(*args)
      # Do something later
    end
  end

end
