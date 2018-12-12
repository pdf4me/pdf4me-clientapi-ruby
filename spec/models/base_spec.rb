require 'spec_helper'

describe Pdf4me::Base, type: :model do
  describe '.defaults' do
    it 'should give the default values' do
      expect(subject.defaults).to eq({});
    end
  end
end