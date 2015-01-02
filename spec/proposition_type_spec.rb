require 'spec_helper'
require 'catlogic'

describe 'proposition_type object' do
  $typeA = PropositionType.new("A")
  $typeE = PropositionType.new("E")
  $typeI = PropositionType.new("I")
  $typeO = PropositionType.new("O")

  it 'can return the correct label for a proposition type A' do
    result = $typeA.label
    result.should == "A"
  end

  it 'can return the correct label for a proposition type O' do
    result = $typeO.label
    result.should == "O"
  end

  it 'can return the correct quantity for proposition type E' do
    result = $typeE.quantity.label
    result.should == "universal"
  end

  it 'can return the correct proposition for proposition type I' do
    proposition = $typeI.proposition

    # prefer a test on the object construction but I don't know how to do that
    quantity = proposition.quantity.label
    subject = proposition.subject.label
    quality = proposition.quality.label
    predicate = proposition.predicate.label
    quantity.should == "particular" && subject.should == "S" && quality.should == "affirmative" && predicate.should == "P"

  end

end