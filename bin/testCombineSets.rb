#!/usr/bin/env ruby

require_relative "../lib/catlog.rb"

premises1 = [Proposition.new("universal", "dogs", "affirmative", "animals", true),
             Proposition.new("universal", "cats", "affirmative", "animals", true),
             Proposition.new("universal", "animals", "affirmative", "mortals", true),
             Proposition.new("universal", "mortals", "affirmative", "things that disintegrate", true),
             Proposition.new("particular", "dogs", "affirmative", "brown", true),
             Proposition.new("particular", "cats", "negative", "mean things", true),
             Proposition.new("particular", "cats", "negative", "mean things", true),
             Proposition.new("universal", "animals", "negative", "divine things", true),
             Proposition.new("particular", "animals", "affirmative", "carnivores", true)]


premises2 = [Proposition.new("universal", "Events", "affirmative", "Caused Happenings", true),
             Proposition.new("universal", "Free Decisions", "negative", "Caused Happenings", true),
             Proposition.new("universal", "Caused Happenings", "affirmative", "Physical", true)]

collection = PremiseCollection.new(premises1)

newcollection = collection.combineSets(premises2)


newcollection.each do |proposition|
  proposition.displayProposition
end
