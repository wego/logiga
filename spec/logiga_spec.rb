require 'spec_helper'

describe Logiga do
  let(:id) { :test_id }
  let(:logger) { Logiga::NoopLogger.new }

  describe '#init' do
    it 'should be able to init multiple times' do
      Logiga.init { |logiga| logiga.register('first', logger) }
      Logiga.init { |logiga| logiga.register('second', logger) }

      expect(Logiga.for(:first)).to eq(logger)
      expect(Logiga.for(:second)).to eq(logger)
    end
  end

  describe '#register' do
    before do
      Logiga.init do |logiga|
        logiga.register(id, logger)
      end
    end

    after do
      Logiga.clear
    end

    context 'given an id' do
      it 'should return the logger' do
        expect(Logiga.for(:test_id)).to eq(logger)
      end
    end

    context 'given another id' do
      let(:id) { :another_test_id }
      it 'should return the other logger' do
        expect(Logiga.for(:another_test_id)).to eq(logger)
      end
    end
  end

  describe '#for' do
    context 'given a non-existant id' do
      it 'should return nil' do
        expect(Logiga.for(:non_existant_id)).to be_nil
      end
    end
  end

end
