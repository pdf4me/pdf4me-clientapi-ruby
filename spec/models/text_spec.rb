require 'spec_helper'

describe Pdf4me::Text, type: :model do
  it 'extends base Action' do
    expect(subject).to be_kind_of(Pdf4me::Base)
  end

  describe 'validations' do
    it { should validate_presence_of :value }

    it { should validate_inclusion_of(:font_encoding).in_array %w|unicode winAnsi| }
    it { should validate_inclusion_of(:mode).in_array %w|fill stroke| }
  end

  describe '.defaults' do
    it 'should give the default values' do
      expect(subject.defaults[:format]).to eq(false)
      expect(subject.defaults[:font_encoding]).to eq('unicode')
      expect(subject.defaults[:mode]).to eq('fill')
    end
  end
end