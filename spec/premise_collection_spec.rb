require 'spec_helper'
require 'catlogic'

describe "premise collection object" do

  
  $collection2 = PremiseCollection.new([Proposition.new(Quantity.new("universal"), Term.new("Mammals"), Quality.new("affirmative"), Term.new("Mortal Things"), true),
               Proposition.new(Quantity.new("universal"), Term.new("People"), Quality.new("affirmative"), Term.new("Mammals"), true)])

  $collection3 = PremiseCollection.new([Proposition.new(Quantity.new("universal"), Term.new("Mammals"), Quality.new("affirmative"), Term.new("Mortal Things"), true),
                Proposition.new(Quantity.new("universal"), Term.new("People"), Quality.new("affirmative"), Term.new("Mammals"), true),
                Proposition.new(Quantity.new("universal"), Term.new("Ants"), Quality.new("negative"), Term.new("People"), true)])

  $collection3repeat = PremiseCollection.new([Proposition.new(Quantity.new("universal"), Term.new("Mammals"), Quality.new("affirmative"), Term.new("Mortal Things"), true),
                Proposition.new(Quantity.new("universal"), Term.new("People"), Quality.new("affirmative"), Term.new("Mammals"), true),
                Proposition.new(Quantity.new("universal"), Term.new("People"), Quality.new("affirmative"), Term.new("Mammals"), true)])

  $collection4 = PremiseCollection.new([Proposition.new(Quantity.new("universal"), Term.new("Dogs"), Quality.new("affirmative"), Term.new("Mortal Things"), true),
                Proposition.new(Quantity.new("universal"), Term.new("People"), Quality.new("affirmative"), Term.new("Mammals"), true),
                Proposition.new(Quantity.new("universal"), Term.new("Ants"), Quality.new("negative"), Term.new("Cats"), true),
                Proposition.new(Quantity.new("universal"), Term.new("Zebras"), Quality.new("negative"), Term.new("Whales"), true)])

  it "should confirm that there are two or more premises in the collection" do
    result = $collection2.at_least_two?
    result.should == true
  end

  it 'should return the size of the collection3 as 3 (aka the number of propositions in the collection' do
    result = $collection3.size
    result.should == 3
  end

  it 'should reduce collection3repeat to unique propositions only and return count of 2' do
    result = $collection3repeat.unique_set
    result.count.should == 2
  end

  it 'should be able to provide actual size of initual set even with a repeat premise' do 
    result = $collection3repeat.initial_propositions
    result.count.should == 3
  end
  it 'should be able to provide actual size of unique set when set with a repeat premise is given' do 
    result = $collection3repeat.unique_propositions
    result.count.should == 2
  end

## testing unique set method
  it 'should reduce non-unique collection to a new collection with unique propositions only and should have a count of 2' do
    collection = PremiseCollection.new([Proposition.new(Quantity.new("universal"), Term.new("Mammals"), Quality.new("affirmative"), Term.new("Mortal Things"), true),
                                          Proposition.new(Quantity.new("universal"), Term.new("Mammals"), Quality.new("affirmative"), Term.new("Mortal Things"), true),
                                          Proposition.new(Quantity.new("universal"), Term.new("Ants"), Quality.new("Negative"), Term.new("Mammals"), true)])
    result = collection.unique_set
    result.size.should == 2

  end
## Testing factorial on collections2-4; answers calculated based on permutations formula P(n,r) = n! / (n - r)! where n=total set and r=lenght of the subset. 
## aka "The number of ways of obtaining an ordered subset of r elements from a set of n elements."
  it 'should return a premise pair collection for two propositions whose set count is 2' do
    result = $collection2.premise_pairs
    result.count.should == 2
  end

  it 'should return a premise pair collection for three propositions whose set count is 3' do
    result = $collection3.premise_pairs
    result.count.should == 6
  end
  it 'should return a premise pair collection for three propositions whose set count is 4' do
    result = $collection4.premise_pairs
    result.count.should == 12
  end

##Testing possible three-term pairs on collections 2-4
  it 'should return answer of 2 for total number of three term paris in $collection2' do 
    result = $collection2.three_term_premise_pairs
    result.count.should == 2
  end
  it 'should return answer of 4 for total number of three term paris in $collection3' do 
    result = $collection3.three_term_premise_pairs
    result.count.should == 4
  end
  it 'should return answer of 0 for total number of three term paris in $collection4' do 
    result = $collection4.three_term_premise_pairs
    result.count.should == 0
  end

  it 'should return valid syllogisms for two premise AA (1) premise pair in $collection 2 (should return an AAA1, AAI1 and an AAI4' do
    result = $collection2.valid_syllogisms
    result.count.should == 3
  end

  it 'should return all valid inferred truths for AA (1) premise pair -- the conclusions for an AAA1, AAI1 and AAI4 syllogisms' do 
    result = $collection2.inferred_truths_all
    result.count.should == 3
  end
  ## this test isn't very good since collection2 does not generate any repeat inferred truths.
  it 'should return unique valid inferred truths for AA (1) premise pair' do 
    result = $collection2.inferred_truths_new
    result.count.should == 3
  end
end