require 'spec_helper'

describe Pdf4me::PageSelection, type: :model do
  it 'extends base Action' do
    expect(subject).to be_kind_of(Pdf4me::Base)
  end

  describe 'validations' do
    it { should validate_inclusion_of(:page_sequence).in_array %w|all first last odd even notFirst notLast| }
  end

  describe '.defaults' do
    it 'should give the default values' do
      expect(subject.defaults[:page_sequence]).to eq('all')
    end
  end
end