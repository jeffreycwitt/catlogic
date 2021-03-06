#!/usr/bin/env ruby

begin
  require 'catlogic'
rescue LoadError
  require 'rubygems'
  require 'catlogic'
end

mood = Catlogic::Mood.new(Catlogic::PropositionType.new("A"), Catlogic::PropositionType.new("A"), Catlogic::PropositionType.new("A"))
figure = Catlogic::Figure.new(3)
form = Catlogic::Form.new(mood, figure)
puts "====================="
puts "Testing: #{form.label}"

syllogism = form.syllogism

puts "=====Propositional form====="
puts form.syllogism.label

### This is redundant in testSyllogism ##
puts "=====Validity===="
puts "Validity: #{syllogism.validity}"


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





