require 'spec_helper'

describe Pdf4me::WrapperAction, type: :action do

  describe 'methods' do
    describe '.client' do
      it 'should return the right client' do
        expect(subject.client).to be_kind_of(Pdf4me::Client)
      end
    end

    describe '.defaults' do
      it 'should return empty defaults for base' do
        expect(subject.defaults).to eq({})
      end
    end

    describe '.parsed_json_response' do
      it 'should parse the json correctly' do
        expect(subject.send(:parsed_json_response, '{"hello": "world"}')).to eq({hello: "world"})
      end
    end
  end
end
