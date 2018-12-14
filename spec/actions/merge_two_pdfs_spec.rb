require 'spec_helper'

describe Pdf4me::MergeTwoPdfs, type: :action do

  it 'extends Base Action' do
    expect(subject).to be_kind_of(Pdf4me::WrapperAction)
  end

  describe 'validations' do
    it { should validate_presence_of :file1 }
    it { should validate_presence_of :file2 }
  end

  describe 'methods' do
    describe '.path' do
      it 'should give the right path' do
        expect(subject.path).to eq('/Merge/Merge2Pdfs')
      end
    end
  end
end