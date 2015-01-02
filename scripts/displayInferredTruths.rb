#!/usr/bin/env ruby

begin
  require 'catlogic'
rescue LoadError
  require 'rubygems'
  require 'catlogic'
end

premises2 = [Proposition.new("universal", "Mammals", "affirmative", "Mortal Things", true),
            Proposition.new("universal", "People", "affirmative", "Mammals", true)]

premises3 = [Proposition.new("universal", "Mammals", "affirmative", "Mortal Things", true),
            Proposition.new("universal", "People", "affirmative", "Mammals", true), 
            Proposition.new("universal", "Ants", "negative", "Mammals", true)]


premises4 = [Proposition.new("universal", "planes", "affirmative", "things with wings", true),
            Proposition.new("particular", "planes", "affirmative", "things with propellors", true),
            Proposition.new("universal", "pilots", "affirmative", "things that fly planes", true),
            Proposition.new("universal", "things that fly planes", "affirmative", "tall things", true)]

premises5 = [Proposition.new("universal", "dogs", "affirmative", "animals", true),
            Proposition.new("universal", "cats", "affirmative", "animals", true),
            Proposition.new("universal", "animals", "affirmative", "mortals", true),
            Proposition.new("universal", "mortals", "affirmative", "things that disintegrate", true),
            Proposition.new("particular", "dogs", "affirmative", "brown", true)]
            




        	

collection = PremiseCollection.new(premises4)


puts "==============="
puts "intial set"
puts premises4.count
puts 
premises4.each do |proposition|
proposition.displayProposition
end
puts "==============="

collection.displayLoopedInferredTruths
#puts "#{collection.getNumberOfInferredTruths} / #{collection.getNumberOfInputTruths}: #{collection.getRatioInputToInferred}/1"
