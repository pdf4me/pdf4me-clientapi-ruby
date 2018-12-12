require 'spec_helper'

describe Pdf4me::DocLog, type: :model do
  it 'extends base Action' do
    expect(subject).to be_kind_of(Pdf4me::Base)
  end

  describe '.doc_log_level=' do
    it 'the log level is 0' do
      subject.doc_log_level = (0)
      expect(subject.doc_log_level).to eq('verbose')
    end

    it 'the log level is 1' do
      subject.doc_log_level = (1)
      expect(subject.doc_log_level).to eq('info')
    end

    it 'the log level is 2' do
      subject.doc_log_level = (2)
      expect(subject.doc_log_level).to eq('warning')
    end

    it 'the log level is 3' do
      subject.doc_log_level = (3)
      expect(subject.doc_log_level).to eq('error')
    end

    it 'the log level is 4' do
      subject.doc_log_level = (4)
      expect(subject.doc_log_level).to eq('timing')
    end
  end
end


