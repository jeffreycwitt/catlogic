#!/usr/bin/env ruby

begin
  require 'catlogic'
rescue LoadError
  require 'rubygems'
  require 'catlogic'
end

premisesArray = [Proposition.new(Quantity.new("universal"), Term.new("Events"), Quality.new("affirmative"), Term.new("Caused Happenings"), true),
            Proposition.new(Quantity.new("universal"), Term.new("Free Decisions"), Quality.new("negative"), Term.new("Caused Happenings"), true),
            Proposition.new(Quantity.new("universal"), Term.new("Fun"), Quality.new("affirmative"), Term.new("Events"), true)]




proposition = Proposition.new(Quantity.new("universal"), Term.new("Free Decisions"), Quality.new("negative"), Term.new("Caused Happenings"), true)

puts proposition.number_of_occurences(premisesArray)