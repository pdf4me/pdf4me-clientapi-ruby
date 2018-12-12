require 'spec_helper'

describe Pdf4me::ComplexAction, type: :action do

  describe '.methods' do
    describe '.client' do
      it 'should return the right client' do
        expect(subject.client).to be_kind_of(Pdf4me::Client)
      end
    end
  end
end