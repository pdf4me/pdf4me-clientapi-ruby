require 'spec_helper'

describe Pdf4me::StampAction, type: :model do
  it 'extends base Action' do
    expect(subject).to be_kind_of(Pdf4me::Base)
  end

  describe 'validations' do
    it { should validate_inclusion_of(:page_sequence).in_array %w|all first last odd even notFirst notLast| }
    it { should validate_inclusion_of(:scale).in_array %w|relToA4| }
    it { should validate_inclusion_of(:align_x).in_array %w|left center right| }
    it { should validate_inclusion_of(:align_y).in_array %w|top middle bottom| }
    it { should validate_inclusion_of(:stamp_type).in_array %w|annotation foreground background| }
  end

  describe '.defaults' do
    it 'should give the default values' do
      expect(subject.defaults[:page_sequence]).to eq('1')
      expect(subject.defaults[:autoorientation]).to eq(false)
      expect(subject.defaults[:alpha]).to eq(1.0)
      expect(subject.defaults[:scale]).to eq('relToA4')
      expect(subject.defaults[:align_x]).to eq('left')
      expect(subject.defaults[:align_y]).to eq('bottom')
      expect(subject.defaults[:stamp_type]).to eq('annotation')
    end
  end
end