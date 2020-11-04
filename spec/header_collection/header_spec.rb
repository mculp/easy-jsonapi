# frozen_string_literal: true

require 'rack/jsonapi/header_collection/header'
require 'shared_examples/name_value_pair_classes_tests'

describe JSONAPI::HeaderCollection::Header do
  it_behaves_like 'name value pair classes' do
    let(:pair) { JSONAPI::HeaderCollection::Header.new(:name, 'value') }
  end
end