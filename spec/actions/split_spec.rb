require 'spec_helper'

describe Pdf4me::Split, type: :action do

  it 'extends Base action' do
    expect(subject).to be_kind_of(Pdf4me::ComplexAction)
  end

  describe 'methods' do
    describe '.path' do
      it 'should give the right path' do
        expect(subject.path).to eq('/Split/Split')
      end
    end
  end
end