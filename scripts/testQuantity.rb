#!/usr/bin/env ruby

begin
  require 'catlogic'
rescue LoadError
  require 'rubygems'
  require 'catlogic'
end

quantity = Catlogic::Quantity.new("universal")

puts quantity.label