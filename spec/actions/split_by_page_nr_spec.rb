require 'spec_helper'

describe Pdf4me::SplitByPageNr, type: :action do

  it 'extends Base Action' do
    expect(subject).to be_kind_of(Pdf4me::WrapperAction)
  end

  describe 'validations' do
    it { should validate_presence_of :file }
    it { should validate_numericality_of :page_number }
  end

  describe 'methods' do
    describe '.path' do
      it 'should give the right path' do
        expect(subject.path).to eq('/Split/SplitByPageNr')
      end
    end
  end
end