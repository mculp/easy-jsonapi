# frozen_string_literal: true

require 'easy/jsonapi/exceptions/document_exceptions'
require 'easy/jsonapi/exceptions/headers_exceptions'
require 'easy/jsonapi/exceptions/naming_exceptions'
require 'easy/jsonapi/exceptions/query_params_exceptions'
require 'easy/jsonapi/exceptions/user_defined_exceptions'
require 'easy/jsonapi/exceptions/json_parse_error'

module JSONAPI
  # Namespace for the gem's Exceptions
  module Exceptions
    # Validates that the Query Parameters comply with the JSONAPI specification
    module QueryParamsExceptions
    end

    # Validates that Headers comply with the JSONAPI specification
    module HeadersExceptions
    end

    # Validates that the request or response document complies with the JSONAPI specification
    module DocumentExceptions
    end

    # Checking for JSONAPI naming rules compliance
    module NamingExceptions
    end

    # Checking for User Defined Exceptions
    module UserDefinedExceptions
    end
  end
end
