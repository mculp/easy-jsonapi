# frozen_string_literal: true

require 'easy/jsonapi/name_value_pair_collection'
require 'easy/jsonapi/document/resource/attributes/attribute'

module JSONAPI
  class Document
    class Resource
      # The attributes of a resource
      class Attributes < JSONAPI::NameValuePairCollection
  
        # @param attr_arr [Array<JSONAPI::Document::Resource::Attributes::Attribute] 
        #   The collection of attributes to initialize the collection with.
        def initialize(attr_arr = [])
          super(attr_arr, item_type: JSONAPI::Document::Resource::Attributes::Attribute)
        end

        # Add a jsonapi member to the collection
        # @param attribute [JSONAPI::Document::Resource::Attributes::Attribute] The member to add
        def add(attribute)
          super(attribute, &:name)
        end

        # #empyt? provided by super
        # #include provided by super
        # #add provided by super
        # #each provided from super
        # #remove provided from super
        # #get provided by super
        # #keys provided by super
        # #size provided by super

        # to_s provided from super
      end
    end
  end
end
