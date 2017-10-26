## Kele API Client

Kele is a Ruby Gem API client to access the Bloc API. It provides easy access to and use of the user endpoints of Bloc's API.

Bloc's API provides an external facing JSON Web Token authorized gateway to the Bloc application. User can access it via cURL, but the Kele API client can manage the low-level details of making requests and handling responses.

### How it works

1) Install Kele.
```bash
$ gem install kele
```
---
2) Initialize and authorize Kele with a Bloc username and password
```bash
$ irb
>> require 'kele'
#=> true
>> client = Kele.new("gahee@example.com", "abc123")
#=> #<Kele:0x007faa068e01b8 @base_uri="https://www.bloc.io/api/v1", @options={:query=>{:email=>"gahee@example.com", :password=>"abc123"}}>
```
---
3) Retrieve the current user as a JSON blob
 * Source code
```ruby
def get_me
  # Pass the auth_token via HTTParty's headers option.
  response = self.class.get("#{@base_uri}/users/me", headers: { "authorization" => user_token })
  # Convert the data to a Ruby hash.
  JSON.parse response.body
end
```
 * Usage example
```bash
$ irb
>> client = Kele.new("gahee@example.com", "abc123")
>> client.get_me
#=> {"id"=>12345, "name"=>"Gahee Heo", "email"=>"gahee@example.com", "time_zone"=>{"name"=>"Central Time (US & Canada)", "string"=>"(GMT-06:00) Central Time (US & Canada)", "identifier"=>"America/Chicago"}}
```
---
4) Retrieve a list of messages, respond to an existing message, and create a new message thread
 * Source code
```ruby
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
```
 * Usage example
```bash
#returns the first page of message threads
>> client.get_messages(1)
#=> {"items"=>[{"id"=>12345, "token"=>"12345XXX", "subject"=>"", "updated_at"=>"2017-03-18T13:48:31.552-07:00", "unread"=>false, "preview"=>"Hello", "first_name"=>"Foo", "last_name"=>"Bar", "page"=>"1"}, {...}]
```