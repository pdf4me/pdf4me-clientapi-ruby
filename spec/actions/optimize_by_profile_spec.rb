require 'spec_helper'

describe Pdf4me::OptimizeByProfile, type: :action do

  it "extends Base Action" do
    expect(subject).to be_kind_of(Pdf4me::WrapperAction)
  end

  describe 'validations' do
    it { should validate_presence_of :file }
    it { should validate_presence_of :profile }
    it { should validate_presence_of :save_path }
  end

  describe 'methods' do
    describe '.path' do
      it 'should give the right path' do
        expect(subject.path).to eq('/Optimize/OptimizeByProfile')
      end
    end
  end
end
