module Line
  class PushMessageJob < ApplicationJob
    queue_as :default

    def perform(user_id, messages)
      # endpoint URL
      endpoint = 'https://api.line.me/v2/bot/message/push'

      # create header
      headers = {
        "Content-Type": 'application/json',
        "Authorization": "Bearer #{ENV['LINE_CHANNEL_TOKEN']}"
        # 'X-Line-Retry-Key' => "#{UUID}" ## Optional
      }

      # create payload
      payload = {
        "to": user_id,
        "messages": build_messages(messages)
      }.to_json

      # POST request
      response = RestClient.post(endpoint, payload, headers)

      p response
    end

    private

    def build_messages(messages)
      messages.map do |message|
        {
          "type": 'text',
          "text": message
        }
      end
    end
  end
end
