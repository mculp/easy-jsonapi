# frozen_string_literal: true

require 'easy/jsonapi/document/meta/meta_member'
require 'shared_examples/document_collections'

describe JSONAPI::Document::Meta do
  let(:item_class) { JSONAPI::Document::Meta::MetaMember }
  
  obj_arr = [
    { name: "copyright", value: "Copyright 2015 Example Corp." },
    { name: "authors", value: ["Yehuda Katz", "Steve Klabnik", "Dan Gebhardt", "Tyler Kellen"] }
  ]

  let(:c_size) { 2 }
  let(:keys) { %i[copyright authors] }
  let(:ex_item_key) { :copyright }
  let(:ex_item) { JSONAPI::Document::Meta::MetaMember.new('copyright', 'Copyright 2015 Example Corp.') }
  
  let(:to_string) do
    '{ ' \
    "\"copyright\": \"Copyright 2015 Example Corp.\", " \
    "\"authors\": [\"Yehuda Katz\", \"Steve Klabnik\", " \
    "\"Dan Gebhardt\", \"Tyler Kellen\"]" \
    ' }'
  end

  let(:to_hash) do
    {
      copyright: 'Copyright 2015 Example Corp.',
      authors: ['Yehuda Katz', 'Steve Klabnik', 'Dan Gebhardt', 'Tyler Kellen']
    }
  end

  item_arr = obj_arr.map do |i|
    JSONAPI::Document::Meta::MetaMember.new(i[:name], i[:value])
  end
  let(:c) { JSONAPI::Document::Meta.new(item_arr, &:name) }
  let(:ec) { JSONAPI::Document::Meta.new }
  
  it_behaves_like 'document collections'
end
