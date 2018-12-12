require 'spec_helper'

describe Pdf4me::Translate, type: :model do
  it 'extends base Action' do
    expect(subject).to be_kind_of(Pdf4me::Base)
  end

  describe 'validations' do
    it { should validate_presence_of :offset_x }
    it { should validate_presence_of :offset_y }
  end
end