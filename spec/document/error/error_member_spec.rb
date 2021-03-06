# frozen_string_literal: true

require 'easy/jsonapi/document/error/error_member'
require 'shared_examples/name_value_pair_tests'

describe JSONAPI::Document::Error::ErrorMember do
  it_behaves_like 'name value pair tests' do
    let(:pair) { JSONAPI::Document::Error::ErrorMember.new(:name, 'value') }
  end
end
