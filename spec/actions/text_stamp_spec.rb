require 'spec_helper'

describe Pdf4me::TextStamp, type: :action do

  it "extends Base Action" do
    expect(subject).to be_kind_of(Pdf4me::WrapperAction)
  end

  describe 'validations' do
    before(:each) do
      subject.pages=(3)
    end
    it { should validate_presence_of :text }
    it { should validate_presence_of :pages }
  end

  describe 'methods' do
    describe '.path' do
      it 'should give the right path' do
        expect(subject.path).to eq('/Stamp/TextStamp')
      end
    end
  end
end
