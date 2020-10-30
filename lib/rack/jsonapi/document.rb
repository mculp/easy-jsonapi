# frozen_string_literal: true

module JSONAPI

  # Contains all objects relating to a JSONAPI Document
  # @todo Add Response side of the document as well
  class Document

    attr_accessor :data, :included, :meta, :links

    # @query_param data [Data] the already initialized Data class
    # @query_param included [Included] the already initialized Included class
    # @query_param meta [Meta] the already initialized Meta class
    # @query_param links [Links] the already initialized Links class
    def initialize(document_members_hash)
      @data = document_members_hash[:data]
      @meta = document_members_hash[:meta]
      @links = document_members_hash[:links]
      @included = document_members_hash[:included]
      @errors = document_members_hash[:errors]
      @jsonapi = document_members_hash[:jsonapi]
    end

    # To String
    def to_s
      '{ ' \
        "\"data\": #{@data || 'null'}, " \
        "\"meta\": #{@meta || 'null'}, " \
        "\"links\": #{@links || 'null'}, " \
        "\"errors\": #{@errors || 'null'}, " \
        "\"jsonapi\": #{@jsonapi || 'null'}, " \
        "\"included\": #{@included || 'null'}" \
      ' }'
    end
  end
end
