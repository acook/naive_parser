#!/usr/bin/env rspec
# BDD specs for naive_parser

require 'spec_helper'

describe NaiveParser do
  describe '#parse' do
    it 'returns an array' do
      plaintext = "cat foo bar"
      NaiveParser.new(plaintext).parse.class.should eq(Array)
    end
  end
end
