#!/usr/bin/env ruby

require_relative "../lib/catlogic"

type = PropositionType.new("O", true)
proposition = type.proposition

## this is repeated from testProposition.rb

puts "======Proposition========="
puts proposition.label
puts "======Proposition Type========="
puts "type: #{proposition.type.label}"
puts "======Assumed Truth Value========="
puts "assumed: #{proposition.truthvalue}"

puts "=====Immediate Inferences========="
contradictory = proposition.contradictory
if proposition.quantity.label == "universal"
  contrary_subcontrary = proposition.contrary
elsif proposition.quantity.label == "particular"
  contrary_subcontrary = proposition.subcontrary
end
subaltern = proposition.subaltern
converse = proposition.converse
obverse = proposition.obverse
contrapolated = proposition.contrapolated

puts "====contradictory: #{contradictory.type.label}: #{contradictory.truthvalue}==="
puts contradictory.label
puts "====contrary/subcontrary: #{contrary_subcontrary.type.label}: #{contrary_subcontrary.truthvalue}===="
puts contrary_subcontrary.label
puts "====subaltern: #{subaltern.type.label}: #{subaltern.truthvalue}===="
puts subaltern.label
puts "====converse: #{converse.type.label}: #{converse.truthvalue}===="
puts converse.label
puts "====obverse: #{obverse.type.label}: #{obverse.truthvalue}===="
puts obverse.label
puts "====contrapolated = #{contrapolated.type.label}: #{contrapolated.truthvalue}===="
puts contrapolated.label