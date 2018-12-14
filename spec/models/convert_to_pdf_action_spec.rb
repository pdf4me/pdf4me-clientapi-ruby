require 'spec_helper'

describe Pdf4me::ConvertToPdfAction, type: :model do

  it 'extends base Action' do
    expect(subject).to be_kind_of(Pdf4me::Base)
  end

  describe 'validations' do
    it { should validate_presence_of :pdf_conformance }
    it { should validate_presence_of :conversion_mode }
    it { should validate_inclusion_of(:pdf_conformance).in_array %w|pdf17 pdfA1 pdfA2 pdfA3| }
    it { should validate_inclusion_of(:conversion_mode).in_array %w|fast detailed| }
  end

  describe '.default ' do
    it 'should give the default values' do
      expect(subject.defaults[:pdf_conformance]).to eq('pdf17')
      expect(subject.defaults[:conversion_mode]).to eq('fast')
    end
  end
end

