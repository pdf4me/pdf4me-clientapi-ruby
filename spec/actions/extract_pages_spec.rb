require 'spec_helper'

describe Pdf4me::ExtractPages, type: :action do

  it 'extends Base Action' do
    expect(subject).to be_kind_of(Pdf4me::WrapperAction)
  end

  describe 'validations' do
    before(:each) do
      subject.pages=(5)
    end
    it { should validate_presence_of :file }
    it { should validate_presence_of :save_path }
  end

  describe 'methods' do
    describe '.path' do
      it 'should give the right path' do
        expect(subject.path).to eq('/Extract/ExtractPages')
      end
    end
  end
end