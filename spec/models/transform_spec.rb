require 'spec_helper'

describe Pdf4me::Transform, type: :model do
  it 'extends base Action' do
    expect(subject).to be_kind_of(Pdf4me::Base)
  end

  describe 'validations' do
    it { should validate_presence_of :a }
    it { should validate_presence_of :b }
    it { should validate_presence_of :c }
    it { should validate_presence_of :d }
    it { should validate_presence_of :x }
    it { should validate_presence_of :y }
  end
end