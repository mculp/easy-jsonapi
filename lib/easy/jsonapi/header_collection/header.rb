# frozen_string_literal: true

require 'easy/jsonapi/header_collection'

module JSONAPI
  class HeaderCollection
    # A http request or response header
    class Header < JSONAPI::NameValuePair
    end
  end
end
