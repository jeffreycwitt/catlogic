require 'spec_helper'
require 'catlogic'

describe "premise pair object" do

  	$major = Catlogic::Proposition.new(Catlogic::Quantity.new("universal"), Catlogic::Term.new("Mammals"), Catlogic::Quality.new("affirmative"), Catlogic::Term.new("Dogs"), true)
	$minor = Catlogic::Proposition.new(Catlogic::Quantity.new("universal"), Catlogic::Term.new("Mammals"), Catlogic::Quality.new("affirmative"), Catlogic::Term.new("Mortal Things"), true)
	$pair = Catlogic::PremisePair.new($major, $minor)

  it 'can return the major proposition' do
    result = $pair.major
    result.should == $major
  end

  it 'can return the minor proposition' do
    result = $pair.minor
    result.should == $minor
  end

  it 'can provide true result when this pair has three and only three distinct terms' do
  	result = $pair.three_term_pair?
  	result.should == true
  end

  it 'can return false result when this pair has only two distinct terms' do
  	major = Catlogic::Proposition.new(Catlogic::Quantity.new("universal"), Catlogic::Term.new("Mammals"), Catlogic::Quality.new("affirmative"), Catlogic::Term.new("Dogs"), true)
	minor = Catlogic::Proposition.new(Catlogic::Quantity.new("universal"), Catlogic::Term.new("Dogs"), Catlogic::Quality.new("affirmative"), Catlogic::Term.new("Mammals"), true)
	pair = Catlogic::PremisePair.new(major, minor)

  	result = pair.three_term_pair?
  	result.should == false
  end

  it 'can return false result when this pair has only four distinct terms' do
  	major = Catlogic::Proposition.new(Catlogic::Quantity.new("universal"), Catlogic::Term.new("Mammals"), Catlogic::Quality.new("affirmative"), Catlogic::Term.new("Dogs"), true)
	minor = Catlogic::Proposition.new(Catlogic::Quantity.new("universal"), Catlogic::Term.new("Cats"), Catlogic::Quality.new("affirmative"), Catlogic::Term.new("Wicked"), true)
	pair = Catlogic::PremisePair.new(major, minor)

  	result = pair.three_term_pair?
  	result.should == false
  end

  it 'can return middle term of pair' do 
  	result = $pair.middle
  	result.label.should == "Mammals"
  end

  it 'can retrieve possible conclusions for a premise pair' do 
    result = $pair.possible_conclusions
    result.count.should == 4
  end

  


end