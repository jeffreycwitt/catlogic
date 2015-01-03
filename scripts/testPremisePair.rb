#!/usr/bin/env ruby

begin
  require 'catlogic'
rescue LoadError
  require 'rubygems'
  require 'catlogic'
end

premise1 = Catlogic::Proposition.new("universal", "Mammals", "affirmative", "Dogs", true)
premise2 = Catlogic::Proposition.new("universal", "Mammals", "affirmative", "Mortal Things", true)


pair = Catlogic::PremisePair.new(premise1, premise2)
puts pair.isThreeTermPair?;