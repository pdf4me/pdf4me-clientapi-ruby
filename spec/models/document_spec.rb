require 'spec_helper'

describe Pdf4me::Document, type: :model do

  it 'extends base Action' do
    expect(subject).to be_kind_of(Pdf4me::Base)
  end

  describe 'validations' do
    it { should validate_presence_of :doc_data }
  end
end