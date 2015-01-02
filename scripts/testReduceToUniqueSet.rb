#!/usr/bin/env ruby

begin
  require 'catlogic'
rescue LoadError
  require 'rubygems'
  require 'catlogic'
end

premisesArray = [Proposition.new("universal", "Events", "affirmative", "Caused Happenings", true),
                 Proposition.new("universal", "Free Decisions", "negative", "Caused Happenings", true),
                 Proposition.new("universal", "Fun", "affirmative", "Events", true),
                 Proposition.new("universal", "Fun", "affirmative", "Events", true),
                 Proposition.new("universal", "Fun", "affirmative", "Events", true)]


collection = PremiseCollection.new(premisesArray)

reducedcollection = collection.reduceToUniqueSet

reducedcollection.each do |proposition|
  proposition.displayProposition
end