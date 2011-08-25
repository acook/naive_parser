#!/usr/bin/env rspec
# BDD specs for naive_parser

require './naive_parser'
Bundler.require(:test)

describe NaiveParser do
  describe '#parse' do
    it 'returns an array' do
      plaintext = "cat foo bar"
      NaiveParser.new(plaintext).parse.class.should eq(Array)
    end
  end
end

describe 'naive_parser executable' do
  it "doesn't die horribly" do
    require 'open4'
    status = Open4.popen4('./naive_parser') {}
    status.to_i.should eq(256)
  end
end
