#!/usr/bin/env ruby

begin
  require 'catlogic'
rescue LoadError
  require 'rubygems'
  require 'catlogic'
end

premises1 = [Catlogic::Proposition.new("universal", "dogs", "affirmative", "animals", true),
             Catlogic::Proposition.new("universal", "cats", "affirmative", "animals", true),
             Catlogic::Proposition.new("universal", "animals", "affirmative", "mortals", true),
             Catlogic::Proposition.new("universal", "mortals", "affirmative", "things that disintegrate", true),
             Catlogic::Proposition.new("particular", "dogs", "affirmative", "brown", true),
             Catlogic::Proposition.new("particular", "cats", "negative", "mean things", true),
             Catlogic::Proposition.new("particular", "cats", "negative", "mean things", true),
             Catlogic::Proposition.new("universal", "animals", "negative", "divine things", true),
             Catlogic::Proposition.new("particular", "animals", "affirmative", "carnivores", true)]


premises2 = [Catlogic::Proposition.new("universal", "Events", "affirmative", "Caused Happenings", true),
             Catlogic::Proposition.new("universal", "Free Decisions", "negative", "Caused Happenings", true),
             Catlogic::Proposition.new("universal", "Caused Happenings", "affirmative", "Physical", true)]

collection = Catlogic::PremiseCollection.new(premises1)

newcollection = collection.combineSets(premises2)


newcollection.each do |proposition|
  proposition.displayProposition
end
