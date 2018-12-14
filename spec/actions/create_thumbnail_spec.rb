require 'spec_helper'

describe Pdf4me::CreateThumbnail, type: :action do

  it "extends Base Action" do
    expect(subject).to be_kind_of(Pdf4me::WrapperAction)
  end

  describe 'validations' do
    it { should validate_presence_of :file }
  end

  describe 'methods' do
    describe '.path' do
      it 'should give the right path' do
        expect(subject.path).to eq('/Image/CreateThumbnail')
      end
    end

    describe '.save_path' do
      it 'should give file_name' do
        subject.file = 'abc.pdf'
        expect(subject.save_path).to eq('./abc-thumbnail.png')
      end
    end
  end
end
