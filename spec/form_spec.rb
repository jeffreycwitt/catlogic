require "spec_helper"
require "catlogic"

describe "form object" do
  mood_aaa = Mood.new(PropositionType.new('A'), PropositionType.new('A'), PropositionType.new('A'))
  figure_1 = Figure.new(1)
  $form = Form.new(mood_aaa, figure_1)

  it "should return form label" do
    label = $form.label
    label.should == "AAA1"
  end

  it "should return a syllogism object for the given form" do
    syllogism = $form.syllogism
    major = syllogism.major
    minor = syllogism.minor
    conclusion = syllogism.conclusion

    major.label == "All M are P" && minor.label == "All S are M" && conclusion.label == "All S are P"
  end

  it "should return the name 'Barbara' for a AAA1 syllogism" do 
    name = $form.name
    name.should == "Barbara"
  end
end