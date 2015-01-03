#!/usr/bin/env ruby

begin
  require 'catlogic'
rescue LoadError
  require 'rubygems'
  require 'catlogic'
end

premises2 = [Proposition.new(Quantity.new("universal"), Term.new("Mammals"), Quality.new("affirmative"), Term.new("Mortal Things"), true),
            Proposition.new(Quantity.new("universal"), Term.new("People"), Quality.new("affirmative"), Term.new("Mammals"), true)]

premises3 = [Proposition.new(Quantity.new("universal"), Term.new("Mammals"), Quality.new("affirmative"), Term.new("Mortal Things"), true),
            Proposition.new(Quantity.new("universal"), Term.new("People"), Quality.new("affirmative"), Term.new("Mammals"), true), 
            Proposition.new(Quantity.new("universal"), Term.new("Ants"), Quality.new("negative"), Term.new("Mammals"), true)]


premises4 = [Proposition.new(Quantity.new("universal"), Term.new("planes"), Quality.new("affirmative"), Term.new("things with wings"), true),
            Proposition.new(Quantity.new("particular"), Term.new("planes"), Quality.new("affirmative"), Term.new("things with propellors"), true),
            Proposition.new(Quantity.new("universal"), Term.new("pilots"), Quality.new("affirmative"), Term.new("things that fly planes"), true),
            Proposition.new(Quantity.new("universal"), Term.new("things that fly planes"), Quality.new("affirmative"), Term.new("tall things"), true)]

premises5 = [Proposition.new("universal", "dogs", "affirmative", "animals", true),
            Proposition.new("universal", "cats", "affirmative", "animals", true),
            Proposition.new("universal", "animals", "affirmative", "mortals", true),
            Proposition.new("universal", "mortals", "affirmative", "things that disintegrate", true),
            Proposition.new("particular", "dogs", "affirmative", "brown", true)]
            
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
collection = PremiseCollection.new(premises4)
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
  collection = PremiseCollection.new(combinedset)
  
end

