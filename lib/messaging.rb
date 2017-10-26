module Messaging
  def get_messages(number)
    options = {
      headers: {
        "authorization" => user_token
      },
      body: {
        page: number
      }
    }
    response = self.class.get("#{@base_uri}/message_threads", options)
    JSON.parse response.body
  end

  def create_message(string, text)
    options = {
      headers: {
        "authorization" => user_token
      },
      body: {
        user_id: get_me["id"],
        recipient_id: mentor_id,
        subject: string,
        "stripped-text" => text
      }
    }
    response = self.class.post("#{@base_uri}/messages", options)
    JSON.parse response.body
  end
end
