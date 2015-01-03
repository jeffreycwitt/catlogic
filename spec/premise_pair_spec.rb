require 'spec_helper'
require 'catlogic'

describe "premise pair object" do

  	$major = Proposition.new(Quantity.new("universal"), Term.new("Mammals"), Quality.new("affirmative"), Term.new("Dogs"), true)
	$minor = Proposition.new(Quantity.new("universal"), Term.new("Mammals"), Quality.new("affirmative"), Term.new("Mortal Things"), true)
	$pair = PremisePair.new($major, $minor)

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
  	major = Proposition.new(Quantity.new("universal"), Term.new("Mammals"), Quality.new("affirmative"), Term.new("Dogs"), true)
	minor = Proposition.new(Quantity.new("universal"), Term.new("Dogs"), Quality.new("affirmative"), Term.new("Mammals"), true)
	pair = PremisePair.new(major, minor)

  	result = pair.three_term_pair?
  	result.should == false
  end

  it 'can return false result when this pair has only four distinct terms' do
  	major = Proposition.new(Quantity.new("universal"), Term.new("Mammals"), Quality.new("affirmative"), Term.new("Dogs"), true)
	minor = Proposition.new(Quantity.new("universal"), Term.new("Cats"), Quality.new("affirmative"), Term.new("Wicked"), true)
	pair = PremisePair.new(major, minor)

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