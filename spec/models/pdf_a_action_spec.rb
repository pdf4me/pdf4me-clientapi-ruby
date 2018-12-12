require 'spec_helper'

describe Pdf4me::PdfAAction, type: :model do
  it 'extends base Action' do
    expect(subject).to be_kind_of(Pdf4me::Base)
  end

  describe 'validations' do
    it { should validate_inclusion_of(:compliance).in_array %w|pdfA1b pdfA2B pdfA3b pdfA1a pdfA2a pdfA3a pdfA2u pdfA3u| }
    it { should validate_inclusion_of(:out_put_intent_profile).in_array %w|notSet sRGBColorSpace| }
  end

  describe '.defaults' do
    it 'should give default values' do
      expect(subject.defaults[:compliance]).to eq('pdf2Ab')
      expect(subject.defaults[:allow_downgrade]).to eq(false)
      expect(subject.defaults[:allow_upgrade]).to eq(false)
      expect(subject.defaults[:out_put_intent_profile]).to eq('notSet')
      expect(subject.defaults[:linearize]).to eq(false)
    end
  end
end