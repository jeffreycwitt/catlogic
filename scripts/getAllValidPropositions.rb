#!/usr/bin/env ruby

begin
  require 'catlogic'
rescue LoadError
  require 'rubygems'
  require 'catlogic'
end

typeArray = ["A", "E", "I", "O"]
numberArray = [1,2,3,4]
i=0
c=0
numberArray.each do |i|
  puts "\n"
	typeArray.each do |type|

		typeArray.each do |secondtype|
			typeArray.each do |thirdtype|
        mood = Catlogic::Mood.new(Catlogic::PropositionType.new(type), Catlogic::PropositionType.new(secondtype), Catlogic::PropositionType.new(thirdtype))
				form = Catlogic::Form.new(mood, Catlogic::Figure.new(i))
	
			if form.validity == true
				puts form.label + " " + form.name
			end
		end
	end
end
end