#!/usr/bin/env ruby

require_relative "../lib/catlogic"

major = Proposition.new(Quantity.new("universal"), Term.new("pollution free"), Quality.new("negative"), Term.new("completely efficient"), true)
minor = Proposition.new(Quantity.new("universal"), Term.new("automobile"), Quality.new("negative"), Term.new("completely efficient"), true)
conclusion = Proposition.new(Quantity.new("universal"), Term.new("automobile"), Quality.new("negative"), Term.new("pollution free"), true)
syllogism = Syllogism.new(major, minor, conclusion)

puts "=========="
puts "Testing syllogism (#{syllogism.form.label}):"
puts "====Syllogism======"
puts syllogism.label
puts "====Propositional Form===="
puts Form.new(syllogism.mood, syllogism.figure).syllogism.label
puts "=====Validity===="
puts "Validity: #{syllogism.validity}"
puts "=========="

if (!syllogism.validity)
	if (!syllogism.undistributed_middle_test) 
		puts "undistributed_middle_test failed"
		puts "=========="
	end
	if (!syllogism.illicit_major_test) 
		puts "illicit_major_test failed"
		puts "=========="
	end
	if (!syllogism.illicit_minor_test) 
		puts "illicit_minor_test failed"
		puts "=========="
	end
	if (!syllogism.exclusive_premises_test) 
		puts "exclusive_premises_test failed"
		puts "=========="
	end
	if (!syllogism.affirm_from_neg_test) 
		puts "affirm_from_neg_test failed"
		puts "=========="
	end
	if (!syllogism.neg_from_affirms_test) 
		puts "neg_from_affirms_test"
		puts "=========="
	end    
end