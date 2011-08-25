#!/usr/bin/env rspec
# BDD specs for naive_parser

require 'spec_helper'

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

  it "doesn't fail when you pass in a file" do
    pinfo = Hash.new
    status = Open4.popen4(exe, test_file) do |pid, stdin, stdout, stderr|
      pinfo = {:pid => pid, :stdout => stdout.read, :stderr => stderr.read}
    end

    status.to_i.should eq(0), "## status: #{status.inspect} \n## pinfo: #{pinfo.inspect}"
  end
end
