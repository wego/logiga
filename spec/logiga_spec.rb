require 'spec_helper'

describe Logiga do
  let(:id) { :test_logger }

  let(:logger) { Logiga.logger_for(id) }

  before(:each) do
    Logiga.init do |logiga|
      logiga.register(id, Logiga::NoopLogger.new(STDOUT))
    end
  end

  after(:each) do
    Logiga.clear
  end

  describe '#register' do
    context 'given a id' do
      let(:id) { :test_id_logger }
      it 'should create logger with that id' do
        expect(logger.nil?).to be_false
      end
    end

    context 'given another id' do
      let(:id) { :another_test_id_logger }
      it 'should create logger with that id' do
        expect(logger.nil?).to be_false
      end
    end
  end

  describe '#logger_for' do
    subject(:logger) { Logiga.logger_for(test_id) }

    context 'given correct id' do
      let(:test_id) { id }
      it 'should return a NoopLogger' do
        expect(logger.is_a?(Logiga::NoopLogger)).to be_true
      end
    end

    context 'given non-existant id' do
      let(:test_id) { :me_not_exist }
      it 'should return nil' do
        expect(logger).to be_nil
      end
    end
  end

end
