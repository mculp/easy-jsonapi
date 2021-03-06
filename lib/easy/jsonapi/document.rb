# frozen_string_literal: true

# classes extending document: (require needed because parser requires document)
require 'easy/jsonapi/document/resource'
require 'easy/jsonapi/document/resource_id'
require 'easy/jsonapi/document/error'
require 'easy/jsonapi/document/jsonapi'
require 'easy/jsonapi/document/links'
require 'easy/jsonapi/document/meta'

require 'easy/jsonapi/utility'
require 'easy/jsonapi/exceptions/document_exceptions'

module JSONAPI

  # Contains all objects relating to a JSONAPI Document
  class Document

    attr_reader :data, :meta, :links, :included, :errors, :jsonapi

    # @param document [Hash] A hash of the different possible document members
    #   with the values being clases associated with those members
    #   @data is either a JSONAPI::Document::Resource or a Array<JSONAPI::Document::Resource>
    #                 or a JSONAPI::Document::ResourceId or a Array<JSONAPI::Document::ResourceId>
    #   @meta is JSONAPI::Document::Meta
    #   @links is JSONAPI::Document::Links
    #   @included is an Array<JSONAPI::Document::Resource>
    #   @errors is an Array<JSONAPI::Document::Error>
    #   @jsonapi is JSONAPI::Document::Jsonapi
    # @raise RuntimeError A document must be initialized with a hash of its members.
    def initialize(document = {})
      raise 'JSONAPI::Document parameter must be a Hash' unless document.is_a? Hash
      @data = document[:data]
      @meta = document[:meta]
      @links = document[:links] # software generated?
      @included = document[:included]
      @errors = document[:errors]
      @jsonapi = document[:jsonapi] # online documentation
    end

    # Represent as a string mimicing the JSONAPI format
    def to_s
      '{ ' \
        "#{JSONAPI::Utility.member_to_s('data', @data, first_member: true)}" \
        "#{JSONAPI::Utility.member_to_s('meta', @meta)}" \
        "#{JSONAPI::Utility.member_to_s('links', @links)}" \
        "#{JSONAPI::Utility.member_to_s('included', @included)}" \
        "#{JSONAPI::Utility.member_to_s('errors', @errors)}" \
        "#{JSONAPI::Utility.member_to_s('jsonapi', @jsonapi)}" \
      ' }'
    end

    # Represent as a hash mimicing the JSONAPI format
    def to_h
      to_return = {}
      JSONAPI::Utility.to_h_member(to_return, @data, :data)
      JSONAPI::Utility.to_h_member(to_return, @meta, :meta)
      JSONAPI::Utility.to_h_member(to_return, @links, :links)
      JSONAPI::Utility.to_h_member(to_return, @included, :included)
      JSONAPI::Utility.to_h_member(to_return, @errors, :errors)
      JSONAPI::Utility.to_h_member(to_return, @jsonapi, :jsonapi)
      to_return
    end

    # Check if the document is JSONAPI compliant
    # @raise If the document's to_h does not comply
    def validate
      JSONAPI::Exceptions::DocumentExceptions.check_compliance(to_h)
    end
  end
end
