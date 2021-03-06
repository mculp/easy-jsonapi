# frozen_string_literal: true

require 'easy/jsonapi/name_value_pair_collection'
require 'easy/jsonapi/document/resource/relationships/relationship'
require 'easy/jsonapi/utility'

module JSONAPI
  class Document
    class Resource
      # A JSONAPI resource's relationships
      class Relationships < JSONAPI::NameValuePairCollection
        
        # @param rels_obj_arr [Array<JSONAPI::Document::Resource::Relationships::Relationship]
        #   The collection of relationships to initialize the collection with
        def initialize(rels_obj_arr = [])
          super(rels_obj_arr, item_type: JSONAPI::Document::Resource::Relationships::Relationship)
        end

        # Add a jsonapi member to the collection
        # @param relationship [JSONAPI::Document::Resource::Relationships::Relationship] The member to add
        def add(relationship)
          super(relationship, &:name)
        end

        # The jsonapi hash representation of a resource's relationships
        # @return [Hash] A resource's relationships
        def to_h
          to_return = {}
          each do |rel|
            to_return[rel.name.to_sym] = {}
            JSONAPI::Utility.to_h_member(to_return[rel.name.to_sym], rel.links, :links)
            JSONAPI::Utility.to_h_member(to_return[rel.name.to_sym], rel.data, :data)
            JSONAPI::Utility.to_h_member(to_return[rel.name.to_sym], rel.meta, :meta)
          end
          to_return
        end
      end
    end
  end
end
