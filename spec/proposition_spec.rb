require 'spec_helper'
require 'catlogic'

describe 'proposition object' do
  $propositionAtrue = Proposition.new(Quantity.new("universal"), Term.new('dogs'), Quality.new("affirmative"), Term.new('mortal things'), true)
  $propositionIfalse = Proposition.new(Quantity.new("particular"), Term.new('dogs'), Quality.new("affirmative"), Term.new('mortal things'), false)
  $propositionItrue = Proposition.new(Quantity.new("particular"), Term.new('dogs'), Quality.new("affirmative"), Term.new('mortal things'), true)
  it 'can return the quantity' do
    result = $propositionAtrue.quantity
    result.label.should == 'universal'
  end
  it 'can return the quality' do
    result = $propositionAtrue.quality
    result.label.should == 'affirmative'
  end
  it 'can return the subject' do
    result = $propositionAtrue.subject
    result.label.should == 'dogs'
  end
  it 'can return the predicate' do
    result = $propositionAtrue.predicate
    result.label.should == 'mortal things'
  end
  it 'can return the truth value' do
    result = $propositionAtrue.truthvalue
    result.should == true
  end
  it 'can return the type of proposition' do
    type = $propositionAtrue.type
    type.label.should == "A"
  end
  it 'can return the contradictory' do
    quality = $propositionAtrue.contradictory.quality
    quantity = $propositionAtrue.contradictory.quantity
    # need a better test that can test the object rather than just string outputs
    quality.label.should == "negative" && quantity.label.should == "particular"
  end
  it 'can return the correct subaltern of A proposition' do 
  # the sub altern of an A type proposition should be True I proposition
    subaltern = $propositionAtrue.subaltern
      quantity = subaltern.quantity
      subject = subaltern.quality
      quality = subaltern.quality
      predicate = subaltern.quality
      truthvalue = subaltern.truthvalue
    
    quantity.label.should == "particular" && 
        subject.label == "dogs" && 
        quality.label.should == "affirmative" && 
        predicate.label.should == "mortal things" && 
        truthvalue.should == true
  end
  it 'can return the correct contra of a true A Proposition' do
    contrary = $propositionAtrue.contrary
      quantity = contrary.quantity
      subject = contrary.quality
      quality = contrary.quality
      predicate = contrary.quality
      truthvalue = contrary.truthvalue

    quantity.label.should == "universal" &&
        subject.label == "dogs" &&
        quality.label.should == "negative" &&
        predicate.label.should == "mortal things" &&
        truthvalue.should == false
  end
  it 'can return the correct subcontrary response of a true I Proposition' do
    subcontrary = $propositionIfalse.subcontrary
      quantity = subcontrary.quantity
      subject = subcontrary.quality
      quality = subcontrary.quality
      predicate = subcontrary.quality
      truthvalue = subcontrary.truthvalue

    quantity.label.should == "particular" &&
        subject.label == "dogs" &&
        quality.label.should == "negative" &&
        predicate.label.should == "mortal things" &&
        truthvalue.should == true
  end
  it 'can return the correct converse of an true I proposition' do
    converse = $propositionItrue.converse
      quantity = converse.quantity
      subject = converse.quality
      quality = converse.quality
      predicate = converse.quality
      truthvalue = converse.truthvalue

    quantity.label.should == "particular" &&
        subject.label == "mortal things" &&
        quality.label.should == "negative" &&
        predicate.label.should == "dogs" &&
        truthvalue.should == true

  end
  it 'can return the obverse of an true A proposition' do
    obverse = $propositionAtrue.converse
      quantity = obverse.quantity
      subject = obverse.quality
      quality = obverse.quality
      predicate = obverse.quality
      truthvalue = obverse.truthvalue

    quantity.label.should == "universal" &&
        subject.label == "dogs" &&
        quality.label.should == "negative" &&
        predicate.label.should == "non-mortal things" &&
        truthvalue.should == true
  end
  it 'can return the obverse of a true A proposition' do
    obverse = $propositionAtrue.converse
      quantity = obverse.quantity
      subject = obverse.quality
      quality = obverse.quality
      predicate = obverse.quality
      truthvalue = obverse.truthvalue

    quantity.label.should == "universal" &&
        subject.label == "dogs" &&
        quality.label.should == "negative" &&
        predicate.label.should == "non-mortal things" &&
        truthvalue.should == true
  end
  it 'can return the correct contrapolated proposition of a true A proposition' do
    contrapolated = $propositionAtrue.converse
      quantity = contrapolated.quantity
      subject = contrapolated.quality
      quality = contrapolated.quality
      predicate = contrapolated.quality
      truthvalue = contrapolated.truthvalue

    quantity.label.should == "universal" &&
        subject.label == "non-mortal things" &&
        quality.label.should == "affirmative" &&
        predicate.label.should == "non-dogs" &&
        truthvalue.should == true
  end
  it 'can return the correct position of a designated middle term -- in this case dogs' do
    middleterm = Term.new('dogs')
    position = $propositionAtrue.position_of_term(middleterm)
    position.should == 'subject'
  end
  it 'can return a human readable version of an A proposition' do
    label = $propositionAtrue.label
    label.should == 'All dogs are mortal things'
  end
  it 'can return a human readable version of an I proposition' do
    label = $propositionItrue.label
    label.should == 'Some dogs are mortal things'
  end

  it 'can return distribution for a designated subject term position' do
    distribution = $propositionAtrue.distribution('subject')
    distribution.label.should == "distributed"
  end

  it 'can return distribution for a designated predicate term position' do
    distribution = $propositionItrue.distribution('predicate')
    distribution.label.should == "undistributed"
  end

  it 'can identify that a given proposition is repeated one time in given array' do 
    premisesArray = [
      Proposition.new(Quantity.new("universal"), Term.new("Events"), Quality.new("affirmative"), Term.new("Caused Happenings"), true), 
      Proposition.new(Quantity.new("universal"), Term.new("Free Decisions"), Quality.new("negative"), Term.new("Caused Happenings"), true),
      Proposition.new(Quantity.new("universal"), Term.new("Fun"), Quality.new("affirmative"), Term.new("Events"), true)
    ]
      
      proposition = Proposition.new(Quantity.new("universal"), Term.new("Free Decisions"), Quality.new("negative"), Term.new("Caused Happenings"), true)
      
      result = proposition.number_of_occurences(premisesArray)
      result.should == 1
  end 

  it 'can identify that a given proposition is repeated zero times in given array' do 
    premisesArray = [
      Proposition.new(Quantity.new("universal"), Term.new("Events"), Quality.new("affirmative"), Term.new("Caused Happenings"), true), 
      Proposition.new(Quantity.new("universal"), Term.new("Free Decisions"), Quality.new("negative"), Term.new("Caused Happenings"), true),
      Proposition.new(Quantity.new("universal"), Term.new("Fun"), Quality.new("affirmative"), Term.new("Events"), true)
    ]
      
      proposition = Proposition.new(Quantity.new("universal"), Term.new("Free Decisions"), Quality.new("affirmative"), Term.new("Caused Happenings"), true)
      
      result = proposition.number_of_occurences(premisesArray)
      result.should == 0
  end 
  it 'can return answer true when proposition is unique (not included) in a given set' do

    premisesArray = [
      Proposition.new(Quantity.new("universal"), Term.new("Events"), Quality.new("affirmative"), Term.new("Caused Happenings"), true), 
      Proposition.new(Quantity.new("universal"), Term.new("Free Decisions"), Quality.new("negative"), Term.new("Caused Happenings"), true),
      Proposition.new(Quantity.new("universal"), Term.new("Fun"), Quality.new("affirmative"), Term.new("Events"), true)
    ]
      
      proposition = Proposition.new(Quantity.new("universal"), Term.new("Free Decisions"), Quality.new("affirmative"), Term.new("Caused Happenings"), true)

      result = proposition.unique?(premisesArray)

      result.should == true
  end
  it 'can return answer false when proposition is not unique (i.e. is included) in a given set' do

    premisesArray = [
      Proposition.new(Quantity.new("universal"), Term.new("Events"), Quality.new("affirmative"), Term.new("Caused Happenings"), true), 
      Proposition.new(Quantity.new("universal"), Term.new("Free Decisions"), Quality.new("negative"), Term.new("Caused Happenings"), true),
      Proposition.new(Quantity.new("universal"), Term.new("Fun"), Quality.new("affirmative"), Term.new("Events"), true)
    ]
      
      proposition = Proposition.new(Quantity.new("universal"), Term.new("Free Decisions"), Quality.new("negative"), Term.new("Caused Happenings"), true)

      result = proposition.unique?(premisesArray)

      result.should == false
  end

  it 'can return answer false for two propositions that are not identical' do
        prop1 = Proposition.new(Quantity.new("universal"), Term.new("Events"), Quality.new("affirmative"), Term.new("Caused Happenings"), true)
        prop2 = Proposition.new(Quantity.new("universal"), Term.new("Free Decisions"), Quality.new("negative"), Term.new("Caused Happenings"), true)
        result = prop1.same_as?(prop2)
        result.should == false
  end
  it 'can return answer true for two propositions that are identical' do
    prop1 = Proposition.new(Quantity.new("universal"), Term.new("Events"), Quality.new("affirmative"), Term.new("Caused Happenings"), true)
    prop2 = Proposition.new(Quantity.new("universal"), Term.new("Events"), Quality.new("affirmative"), Term.new("Caused Happenings"), true)
    result = prop1.same_as?(prop2)
    result.should == true
  end


end