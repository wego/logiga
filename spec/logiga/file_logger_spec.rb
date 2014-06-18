require 'spec_helper'

module Logiga
  describe FileLogger do
    let(:test_folder_str) { 'test_folder' }
    let(:test_folder) { Pathname.new('test_folder') }

    let(:filename) { test_folder_str + '/test_logfilename' }

    before(:each) do
      FileUtils.mkdir_p(test_folder)
    end

    after(:each) do
      FileUtils.rm_rf(test_folder)
    end

    describe '#initialize' do
      let!(:logger) { Logiga::FileLogger::new(filename) }

      context 'given filename' do
        it 'should create file' do
          expect(File.exists?(filename)).to be_true
        end
      end

      context 'given another filename' do
        let(:filename) { test_folder_str + '/test_logfilename2' }
        it 'should create file' do
          expect(File.exists?(filename)).to be_true
        end
      end
    end
  end
end
