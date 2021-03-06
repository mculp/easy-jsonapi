# frozen_string_literal: true

require 'easy/jsonapi/collection'
require 'easy/jsonapi/item'
require 'shared_examples/collection_like_classes'

describe JSONAPI::Collection do
  let(:item_class) { JSONAPI::Item }
  
  obj_arr = [
    { name: 'include', value: 'author,comments.likes' },
    { name: 'lebron', value: 'james' },
    { name: 'charles', value: 'barkley' },
    { name: 'michael', value: 'jordan,jackson' },
    { name: 'kobe', value: 'bryant' }
  ]

  item_arr = obj_arr.map { |i| JSONAPI::Item.new(i) }
  let(:c) { JSONAPI::Collection.new(item_arr, item_type: item_class, &:name) }
  let(:ec) { JSONAPI::Collection.new(item_type: item_class) }

  it_behaves_like 'collection-like classes' do
    let(:c_size) { 5 }
    let(:keys) { %i[include lebron charles michael kobe] }
    let(:ex_item_key) { :include }
    let(:ex_item) { JSONAPI::Item.new({ name: 'include', value: 'author,comments.likes' }) }
    
    let(:to_string) do
      '{ ' \
        "\"include\": { \"name\": \"include\", \"value\": \"author,comments.likes\" }, " \
        "\"lebron\": { \"name\": \"lebron\", \"value\": \"james\" }, " \
        "\"charles\": { \"name\": \"charles\", \"value\": \"barkley\" }, " \
        "\"michael\": { \"name\": \"michael\", \"value\": \"jordan,jackson\" }, " \
        "\"kobe\": { \"name\": \"kobe\", \"value\": \"bryant\" }" \
      ' }'
    end


  end

  describe 'dynamic accessor methods' do
    it 'should be able to dynamically access items in the collection' do
      expect(c.charles.value).to eq 'barkley'
      expect(c.lebron.value).to eq 'james'
    end
  end
end
