# frozen_string_literal: true

require 'easy/jsonapi/name_value_pair'
require 'shared_examples/name_value_pair_tests'

describe JSONAPI::NameValuePair do
  it_behaves_like 'name value pair tests' do
    let(:pair) { JSONAPI::NameValuePair.new(:name, 'value') }
  end
end
