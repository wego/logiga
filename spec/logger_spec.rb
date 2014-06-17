require 'spec_helper'

module Logiga
  describe Logger do
    let(:test_folder_string) { 'test_folder' }
    let(:test_folder) { Pathname.new('test_folder') }

    let(:path_string) { test_folder_string + '/test_path' }
    let(:path) { Pathname.new(path_string) }

    let(:filename) { 'test_logfilename' }
    let(:type) { :test_logger }

    before(:each) do
      FileUtils.mkdir_p test_folder
      Logiga::Logger.init do |logger|
        logger.register(type, :info, path, filename)
      end
    end

    after(:each) do
      FileUtils.rm_rf(test_folder)
      Logiga::Logger.clear
    end

    describe '#register' do
      context 'given path as a pathname' do
        it 'should create test path' do
          expect(Dir.exists?(path)).to be_true
        end
      end

      context 'given another path as a pathname' do
        let(:path) { Pathname.new(test_folder_string + '/test_path2') }
        it 'should create test path' do
          expect(Dir.exists?(path)).to be_true
        end
      end

      context 'given path as a string' do
        let(:path) { path_string }
        it 'should create test path' do
          expect(Dir.exists?(path)).to be_true
        end
      end

      context 'given another path as a string' do
        let(:path) { test_folder_string + '/test_path2' }
        it 'should create test path' do
          expect(Dir.exists?(path)).to be_true
        end
      end

      context 'given filename' do
        it 'should create file' do
          expect(File.exists?(path.join(filename))).to be_true
        end
      end

      context 'given another filename' do
        let(:filename) { 'test_logfilename2' }
        it 'should create file' do
          expect(File.exists?(path.join(filename))).to be_true
        end
      end
    end

    describe '#logger_for' do
      subject(:logger) { Logiga::Logger.logger_for(test_type) }

      context 'given correct type' do
        let(:test_type) { type }
        it 'should return a LogigaLogger' do
          expect(logger.is_a?(LogigaLogger)).to be_true
        end
      end

      context 'given non-existant type' do
        let(:test_type) { :me_not_exist }
        it 'should return nil' do
          expect(logger.nil?).to be_true
        end
      end
    end


  end
end
