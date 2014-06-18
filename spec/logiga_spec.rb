require 'spec_helper'

describe Logiga do
  let(:id) { :test_id }
  let(:logger) { Logiga::NoopLogger.new(STDOUT) }

  before do
    Logiga.init do |logiga|
      logiga.register(id, logger)
    end
  end

  after do
    Logiga.clear
  end

  describe '#register' do
    context 'given an id' do
      it 'should create id_logger method' do
        expect(Logiga.test_id_logger).to eq(logger)
      end
    end

    context 'given another id' do
      let(:id) { :another_test_id }
      it 'should create another_id_logger method' do
        expect(Logiga.another_test_id_logger).to eq(logger)
      end
    end
  end
end
