require 'spec_helper'

describe Pdf4me::SplitRes, type: :model do
  it 'extends base Action' do
    expect(subject).to be_kind_of(Pdf4me::Base)
  end
end