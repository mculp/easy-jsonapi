# frozen_string_literal: true

require 'easy/jsonapi/parser'

# Demo Rack App to test middleware class locally.
class RackApp
  
  def call(env)
    status = 200
    headers = { "Content-Type" => "text/plain" }

    jsonapi_request = JSONAPI::Parser.parse_request(env)
    body = 
      [
        "Testing: #{jsonapi_request.class} | #{jsonapi_request.body.data.class}"
      ]
    [status, headers, body]
  end
end
