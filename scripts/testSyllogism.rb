#!/usr/bin/env ruby

begin
  require 'catlogic'
rescue LoadError
  require 'rubygems'
  require 'catlogic'
end

major = Catlogic::Proposition.new(Catlogic::Quantity.new("universal"), Catlogic::Term.new("pollution free"), Catlogic::Quality.new("negative"), Catlogic::Term.new("completely efficient"), true)
minor = Catlogic::Proposition.new(Catlogic::Quantity.new("universal"), Catlogic::Term.new("automobile"), Catlogic::Quality.new("negative"), Catlogic::Term.new("completely efficient"), true)
conclusion = Catlogic::Proposition.new(Catlogic::Quantity.new("universal"), Catlogic::Term.new("automobile"), Catlogic::Quality.new("negative"), Catlogic::Term.new("pollution free"), true)
syllogism = Catlogic::Syllogism.new(major, minor, conclusion)

puts "=========="
puts "Testing syllogism (#{syllogism.form.label}):"
puts "====Syllogism======"
puts syllogism.label
puts "====Propositional Form===="
puts Catlogic::Form.new(syllogism.mood, syllogism.figure).syllogism.label
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