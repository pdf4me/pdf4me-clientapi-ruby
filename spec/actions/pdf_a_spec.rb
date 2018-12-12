require 'spec_helper'

describe Pdf4me::PdfA, type: :action do

  it 'extends Base Action' do
    expect(subject).to be_kind_of(Pdf4me::ComplexAction)
  end

  describe 'methods' do
    describe '.path' do
      it 'should give the right path' do
        expect(subject.path).to eq('PdfA/PdfA')
      end
    end
  end
end