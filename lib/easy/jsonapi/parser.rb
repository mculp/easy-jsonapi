# frozen_string_literal: true

require 'easy/jsonapi/parser/rack_req_params_parser'
require 'easy/jsonapi/parser/headers_parser'
require 'easy/jsonapi/parser/document_parser'
require 'easy/jsonapi/request'

require 'rack'

module JSONAPI
  # Parsing logic in rack middleware
  module Parser
    # @param env [Hash] The rack envirornment hash
    # @return [JSONAPI::Request] the instantiated jsonapi request object
    def self.parse_request(env)
      req = Rack::Request.new(env)

      query_param_collection = RackReqParamsParser.parse(req.GET)
      header_collection = HeadersParser.parse(env)

      req_body = req.body.read # stored separately because can only read 1x
      req.body.rewind # rewind incase something else needs to read the body of the request
      document = includes_jsonapi_document?(env) ? DocumentParser.parse(req_body) : nil

      JSONAPI::Request.new(env, query_param_collection, header_collection, document)
    end

    # Is the content type jsonapi?
    # @param (see #parse_request)
    # @return [TrueClass | FalseClass]
    def self.includes_jsonapi_document?(env)
      env['CONTENT_TYPE'] == 'application/vnd.api+json' &&
        env['REQUEST_METHOD'] != 'GET'
    end

    private_class_method :includes_jsonapi_document?
  end
end
