# frozen_string_literal: true

require 'easy/jsonapi/document/resource/relationships/relationship'
require 'easy/jsonapi/parser/document_parser'

describe JSONAPI::Document::Resource::Relationships::Relationship do
  
  rel_hash = {
    links: {
      self: "http://example.com/articles/1/relationships/author",
      related: "http://example.com/articles/1/author"
    },
    data: { type: "people", id: "9" },
    meta: { count: "1" }
  }

  let(:rel) do 
    JSONAPI::Parser::DocumentParser.parse_relationship(:author, rel_hash)
  end

  context 'when initializing' do
    it 'should raise if not given a hash upon initializitaion' do
      msg = 'Must initialize a JSONAPI::Document::Resource::Relationships::Relationship with a Hash'
      expect { JSONAPI::Document::Resource::Relationships::Relationship.new(123) }.to raise_error msg
    end
  end
  
  context 'checking accessor methods' do
    it 'should be able to access members and get proper classes' do
      expect(rel.links.class).to eq JSONAPI::Document::Links
      expect(rel.data.class).to eq JSONAPI::Document::ResourceId
      expect(rel.meta.class).to eq JSONAPI::Document::Meta
    end
  
    it 'should have proper read methods' do
      expect(rel.name).to eq 'author'
      expect(rel.links.first.name).to eq 'self'
      expect(rel.data.type).to eq 'people'
      expect(rel.meta.get(:count).name).to eq 'count'
    end
  
    it 'should have proper write methods and raise when envoking on read only' do
      msg = 'Cannot change the name of NameValuePair Objects'
      expect { rel.links.first.name = 'new_self' }.to raise_error msg
      expect(rel.data.type = 'new_type').to eq 'new_type'
      expect { rel.meta.get(:count).name = 'new_name' }.to raise_error msg
      expect { rel.name = 'new_name' }.to raise_error NoMethodError
    end
  end

  describe '#to_s' do
    to_string = 
      "\"author\": { " \
        "\"links\": { " \
          "\"self\": \"http://example.com/articles/1/relationships/author\", " \
          "\"related\": \"http://example.com/articles/1/author\" " \
        '}, ' \
        "\"data\": { \"type\": \"people\", \"id\": \"9\" }, " \
        "\"meta\": { \"count\": \"1\" } " \
      '}'

    it 'should work' do
      expect(rel.to_s).to eq to_string
    end
  end
end
