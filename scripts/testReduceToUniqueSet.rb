#!/usr/bin/env ruby

begin
  require 'catlogic'
rescue LoadError
  require 'rubygems'
  require 'catlogic'
end

premisesArray = [Catlogic::Proposition.new("universal", "Events", "affirmative", "Caused Happenings", true),
                 Catlogic::Proposition.new("universal", "Free Decisions", "negative", "Caused Happenings", true),
                 Catlogic::Proposition.new("universal", "Fun", "affirmative", "Events", true),
                 Catlogic::Proposition.new("universal", "Fun", "affirmative", "Events", true),
                 Catlogic::Proposition.new("universal", "Fun", "affirmative", "Events", true)]


collection = Catlogic::PremiseCollection.new(premisesArray)

reducedcollection = collection.reduceToUniqueSet

reducedcollection.each do |proposition|
  proposition.displayProposition
end