#!/usr/bin/env ruby

begin
  require 'catlogic'
rescue LoadError
  require 'rubygems'
  require 'catlogic'
end

premisesArray = [Catlogic::Proposition.new(Catlogic::Quantity.new("universal"), Catlogic::Term.new("Events"), Catlogic::Quality.new("affirmative"), Catlogic::Term.new("Caused Happenings"), true),
            Catlogic::Proposition.new(Catlogic::Quantity.new("universal"), Catlogic::Term.new("Free Decisions"), Catlogic::Quality.new("negative"), Catlogic::Term.new("Caused Happenings"), true),
            Catlogic::Proposition.new(Catlogic::Quantity.new("universal"), Catlogic::Term.new("Fun"), Catlogic::Quality.new("affirmative"), Catlogic::Term.new("Events"), true)]




proposition = Catlogic::Proposition.new(Catlogic::Quantity.new("universal"), Catlogic::Term.new("Free Decisions"), Catlogic::Quality.new("negative"), Catlogic::Term.new("Caused Happenings"), true)

puts proposition.number_of_occurences(premisesArray)