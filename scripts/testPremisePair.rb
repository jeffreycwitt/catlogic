#!/usr/bin/env ruby

begin
  require 'catlogic'
rescue LoadError
  require 'rubygems'
  require 'catlogic'
end

premise1 = Proposition.new("universal", "Mammals", "affirmative", "Dogs", true)
premise2 = Proposition.new("universal", "Mammals", "affirmative", "Mortal Things", true)


pair = PremisePair.new(premise1, premise2)
puts pair.isThreeTermPair?;