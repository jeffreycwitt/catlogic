require "spec_helper"
require "catlogic"

describe "syllogism object" do 

	$majorproposition = Catlogic::Proposition.new(Catlogic::Quantity.new('universal'), Catlogic::Term.new('mortal things'), Catlogic::Quality.new('affirmative'), Catlogic::Term.new('dogs'), true)
	$minorproposition = Catlogic::Proposition.new(Catlogic::Quantity.new('universal'), Catlogic::Term.new('living things'), Catlogic::Quality.new('affirmative'), Catlogic::Term.new('mortal things'), true)
	$conclusionproposition = Catlogic::Proposition.new(Catlogic::Quantity.new('universal'), Catlogic::Term.new('living things'), Catlogic::Quality.new('affirmative'), Catlogic::Term.new('dogs'), true)
	$syllogism_aaa1 = Catlogic::Syllogism.new($majorproposition, $minorproposition, $conclusionproposition)
  $syllogism_aaa4 = Catlogic::Syllogism.new($minorproposition, $majorproposition, $conclusionproposition)

  $majorproposition2 = Catlogic::Proposition.new(Catlogic::Quantity.new('universal'), Catlogic::Term.new('dogs'), Catlogic::Quality.new('affirmative'), Catlogic::Term.new('mortal things'), true)
  $minorproposition2 = Catlogic::Proposition.new(Catlogic::Quantity.new('universal'), Catlogic::Term.new('living things'), Catlogic::Quality.new('affirmative'), Catlogic::Term.new('mortal things'), true)
  $conclusionproposition2 = Catlogic::Proposition.new(Catlogic::Quantity.new('universal'), Catlogic::Term.new('living things'), Catlogic::Quality.new('affirmative'), Catlogic::Term.new('dogs'), true)
  $syllogism_aaa2 = Catlogic::Syllogism.new($majorproposition2, $minorproposition2, $conclusionproposition2)

	it 'can retrieve the middle term' do
		
		middleterm = $syllogism_aaa1.middle
		middleterm.label.should == 'mortal things'
	end

  it 'can return error if not trying to get middle on non three-term syllogism' do
    majorproposition = Catlogic::Proposition.new(Catlogic::Quantity.new('universal'), Catlogic::Term.new('mortal things'), Catlogic::Quality.new('affirmative'), Catlogic::Term.new('living things'), true)
    minorproposition = Catlogic::Proposition.new(Catlogic::Quantity.new('universal'), Catlogic::Term.new('living things'), Catlogic::Quality.new('affirmative'), Catlogic::Term.new('mortal things'), true)
    conclusionproposition = Catlogic::Proposition.new(Catlogic::Quantity.new('universal'), Catlogic::Term.new('living things'), Catlogic::Quality.new('affirmative'), Catlogic::Term.new('dogs'), true)
    syllogism_test = Catlogic::Syllogism.new(majorproposition, minorproposition, conclusionproposition)

    middleterm = syllogism_test.middle
    middleterm.should == 'Error: this is not a three term syllogism'
  end

	it 'can retrieve conclusion' do 
		conclusion = $syllogism_aaa1.conclusion
		conclusion.should == $conclusionproposition
	end

	it 'can retrieve major proposition' do
		major = $syllogism_aaa1.major
		major.should == $majorproposition

	end

	it 'can retrieve minor proposition' do
		major = $syllogism_aaa1.major
		major.should == $majorproposition
	end

	it 'can retrive minor term from the minor propositions' do
		minorterm = $syllogism_aaa1.minorterm
		minorterm.label.should ==	'living things'
	end	

	it 'can retrive major term from the major propositions' do
		majorterm = $syllogism_aaa1.majorterm
		majorterm.label.should ==	'dogs'
	end

	it 'can retrieve mood of syllogism' do
		mood = $syllogism_aaa1.mood
		mood.label.should == 'AAA'
  end

	it 'can retrieve figure object of syllogism' do
		figure = $syllogism_aaa1.figure
		figure.label.should == 1
  end

  it 'can test for undistributed middle fallacy on AAA1 syllogism' do
    validity = $syllogism_aaa1.undistributed_middle_test
    validity.should == true
  end

  it 'can test for undistributed middle fallacy on AAA2 syllogism' do
    validity = $syllogism_aaa2.undistributed_middle_test
    validity.should == false
  end

  it 'can test for illicit major fallacy on AAA1 syllogism' do
    validity = $syllogism_aaa1.illicit_major_test
    validity.should == true
  end

  it 'can test for illicit minor fallacy on AAA1 syllogism' do
    validity = $syllogism_aaa1.illicit_minor_test
    validity.should == true
  end

  it 'can test for exclusive premises fallacy on AAA1 syllogism' do
    validity = $syllogism_aaa1.exclusive_premises_test
    validity.should == true
  end

  it 'can test for affirmative conclusion from negative premise fallacy on AAA1 syllogism' do
    validity = $syllogism_aaa1.affirm_from_neg_test
    validity.should == true
  end

  it 'can test for negative conclusion from affirmative premises fallacy on AAA1 syllogism' do
    validity = $syllogism_aaa1.neg_from_affirms_test
    validity.should == true
  end

  it 'can test for overall validity on AAA1 syllogism' do
    validity = $syllogism_aaa1.validity
    validity.should == true
  end

  it 'can return a human readable form of the syllogism' do
    label = $syllogism_aaa1.label
    label.should == "All mortal things are dogs\nAll living things are mortal things\nAll living things are dogs"
  end

  it 'can return true if this syllogism is a three term syllogism' do
    result = $syllogism_aaa1.three_term?
    result.should == true
  end

end


