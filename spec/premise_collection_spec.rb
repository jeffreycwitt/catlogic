require 'spec_helper'
require 'catlogic'

describe "premise collection object" do

  $collection2 = PremiseCollection.new([Proposition.new(Quantity.new("universal"), Term.new("Mammals"), Quality.new("affirmative"), Term.new("Mortal Things"), true),
               Proposition.new(Quantity.new("universal"), Term.new("People"), Quality.new("affirmative"), Term.new("Mammals"), true)])

  $collection3 = PremiseCollection.new([Proposition.new(Quantity.new("universal"), Term.new("Mammals"), Quality.new("affirmative"), Term.new("Mortal Things"), true),
                Proposition.new(Quantity.new("universal"), Term.new("People"), Quality.new("affirmative"), Term.new("Mammals"), true),
                Proposition.new(Quantity.new("universal"), Term.new("Ants"), Quality.new("Negative"), Term.new("Mammals"), true)])

  it "should confirm that there are two or more premises in the collection" do
    result = $collection2.at_least_two?
    result.should == true
  end

  it 'should return the size of the collection3 as 3 (aka the number of propositions in the collection' do
    result = $collection3.size
    result.should == 3
  end

  it 'should reduce collection to unique propositions only and return count of 3' do
    result = $collection3.unique_set
    result.count.should == 3
  end

  it 'should reduce non-unique collection to unique propositions only and return count of 2' do
    collection = PremiseCollection.new([Proposition.new(Quantity.new("universal"), Term.new("Mammals"), Quality.new("affirmative"), Term.new("Mortal Things"), true),
                                          Proposition.new(Quantity.new("universal"), Term.new("Mammals"), Quality.new("affirmative"), Term.new("Mortal Things"), true),
                                          Proposition.new(Quantity.new("universal"), Term.new("Ants"), Quality.new("Negative"), Term.new("Mammals"), true)])
    result = collection.unique_set
    result.count.should == 2

  end

  it 'should return a premise pair collection for two propositions whose set count is 2' do
    result = $collection2.premise_pairs
    result.count.should == 2
  end
end