#!/usr/bin/env rspec
# BDD specs for naive_parser

require './naive_parser'
Bundler.require(:test)

exe = './naive_parser'
test_file = 'test_file.txt'

describe NaiveParser do
  describe '#parse' do
    it 'returns an array' do
      plaintext = "cat foo bar"
      NaiveParser.new(plaintext).parse.class.should eq(Array)
    end
  end
end

describe 'naive_parser executable' do
  it "exits with a raise when no file found" do
    status = Open4.popen4(exe) {}
    status.to_i.should eq(256)
  end
end
