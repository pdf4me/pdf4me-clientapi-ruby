require 'spec_helper'

describe Pdf4me::Notification, type: :model do
  it 'extends base Action' do
    expect(subject).to be_kind_of(Pdf4me::Base)
  end

  describe '.defaults' do
    it 'gives the default values' do
      expect(subject.defaults[:get_notification]).to eq(false)
    end
  end
end
