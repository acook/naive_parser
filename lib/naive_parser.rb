#!/usr/bin/env ruby
# A very simple, very naive parser

require 'bundler'
Bundler.require(:default)

class NaiveParser
  def initialize(data)
    @data = data
  end

  def parse
    Array.new
  end
end



