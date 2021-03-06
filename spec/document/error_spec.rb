# frozen_string_literal: true

require 'easy/jsonapi/document/error'
require 'easy/jsonapi/document/error/error_member'

require 'easy/jsonapi/document/meta/meta_member'
require 'easy/jsonapi/document/meta'

require 'easy/jsonapi/document/links/link'
require 'easy/jsonapi/document/links'

require 'shared_examples/document_collections'

describe JSONAPI::Document::Error do
  let(:item_class) { JSONAPI::Document::Error::ErrorMember }

  meta_member_obj = JSONAPI::Document::Meta::MetaMember.new('count', '1')
  meta_obj = JSONAPI::Document::Meta.new([meta_member_obj])

  link_obj = JSONAPI::Document::Links::Link.new('related', 'url')
  links_obj = JSONAPI::Document::Links.new([link_obj])
  
  error_member_arr = [
    JSONAPI::Document::Error::ErrorMember.new('status', '422'),
    JSONAPI::Document::Error::ErrorMember.new('title', 'Invalid Attribute'),
    JSONAPI::Document::Error::ErrorMember.new('meta', meta_obj),
    JSONAPI::Document::Error::ErrorMember.new('links', links_obj)
  ]

  let(:c) { JSONAPI::Document::Error.new(error_member_arr, &:name) }
  let(:ec) { JSONAPI::Document::Error.new }

  let(:c_size) { 4 }
  let(:keys) { %i[status title meta links] }
  let(:ex_item_key) { :status }
  let(:ex_item) { JSONAPI::Document::Error::ErrorMember.new('status', '422') }
  
  let(:to_string) do
    '{ ' \
      "\"status\": \"422\", " \
      "\"title\": \"Invalid Attribute\", " \
      "\"meta\": { \"count\": \"1\" }, " \
      "\"links\": { \"related\": \"url\" } " \
    '}'
  end

  let(:to_hash) do
    {
      status: '422',
      title: 'Invalid Attribute',
      meta: { count: '1' },
      links: { related: 'url' }
    }
  end

  it_behaves_like 'document collections'

  context 'when checking dynamic accessors' do
    it 'should be able to access existing members by using their names' do
      expect(c.status).to eq '422'
      expect(c.title).to eq 'Invalid Attribute'
      expect(c.meta.class).to eq JSONAPI::Document::Meta
      expect(c.links.class).to eq JSONAPI::Document::Links
    end

    it 'should raise NoMethodError if attempting to an unknown error member' do
      expect { c.service_number }.to raise_error NoMethodError
    end
  end
end
