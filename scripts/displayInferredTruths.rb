#!/usr/bin/env ruby

begin
  require 'catlogic'
rescue LoadError
  require 'rubygems'
  require 'catlogic'
end

premises2 = [Catlogic::Proposition.new(Catlogic::Quantity.new("universal"), Catlogic::Term.new("Mammals"), Catlogic::Quality.new("affirmative"), Catlogic::Term.new("Mortal Things"), true),
            Catlogic::Proposition.new(Catlogic::Quantity.new("universal"), Catlogic::Term.new("People"), Catlogic::Quality.new("affirmative"), Catlogic::Term.new("Mammals"), true)]

premises3 = [Catlogic::Proposition.new(Catlogic::Quantity.new("universal"), Catlogic::Term.new("Mammals"), Catlogic::Quality.new("affirmative"), Catlogic::Term.new("Mortal Things"), true),
            Catlogic::Proposition.new(Catlogic::Quantity.new("universal"), Catlogic::Term.new("People"), Catlogic::Quality.new("affirmative"), Catlogic::Term.new("Mammals"), true),
            Catlogic::Proposition.new(Catlogic::Quantity.new("universal"), Catlogic::Term.new("Ants"), Catlogic::Quality.new("negative"), Catlogic::Term.new("Mammals"), true)]


premises4 = [Catlogic::Proposition.new(Catlogic::Quantity.new("universal"), Catlogic::Term.new("planes"), Catlogic::Quality.new("affirmative"), Catlogic::Term.new("things with wings"), true),
            Catlogic::Proposition.new(Catlogic::Quantity.new("particular"), Catlogic::Term.new("planes"), Catlogic::Quality.new("affirmative"), Catlogic::Term.new("things with propellors"), true),
            Catlogic::Proposition.new(Catlogic::Quantity.new("universal"), Catlogic::Term.new("pilots"), Catlogic::Quality.new("affirmative"), Catlogic::Term.new("things that fly planes"), true),
            Catlogic::Proposition.new(Catlogic::Quantity.new("universal"), Catlogic::Term.new("things that fly planes"), Catlogic::Quality.new("affirmative"), Catlogic::Term.new("tall things"), true)]

premises5 = [Catlogic::Proposition.new("universal", "dogs", "affirmative", "animals", true),
            Catlogic::Proposition.new("universal", "cats", "affirmative", "animals", true),
            Catlogic::Proposition.new("universal", "animals", "affirmative", "mortals", true),
            Catlogic::Proposition.new("universal", "mortals", "affirmative", "things that disintegrate", true),
            Catlogic::Proposition.new("particular", "dogs", "affirmative", "brown", true)]
            
def display_inferences(collection, iteration) 
  puts "==============="
  puts "inference set number #{iteration}"
  puts "---------------"
  puts "Number of initial propositions: #{collection.unique_propositions.count}"
  puts "---------------"
  puts "Number of new inference #{collection.inferred_truths_new.count}"
  puts "----------------"
  puts "inferred propositions for iteration #{iteration}:"
  puts "----------------"
  collection.inferred_truths_new.each do |proposition|
    puts proposition.label
  end
  puts "==============="
  puts ""
end

# create first combined set or propositions
def combine_sets(oldarray, newarray)
  combinedset = []
  combinedset << oldarray
  combinedset << newarray
  return combinedset.flatten
end

#Set up        	
collection = Catlogic::PremiseCollection.new(premises4)
puts ""
puts "==============="
puts "Initial Set"
puts "---------------"
puts "intial set size: #{collection.size}"
puts "---------------"
puts "input propositions"
puts "----------------"
collection.unique_propositions.each do |proposition|
  puts proposition.label
end
puts "==============="
puts ""


iteration = 1
## basic idea of loop is simply to keep combing input propositions and inferred propositions until there are no more new inferred propositions
while (collection.inferred_truths_new.count != 0)
  display_inferences(collection, iteration)
  iteration += 1
  
  combinedset = combine_sets(collection.unique_propositions, collection.inferred_truths_new)
  collection = Catlogic::PremiseCollection.new(combinedset)
  
end

