require "spec_helper"
require "catlogic"

describe "figure object" do
  $figure_1 = Figure.new(1)

  it "should return the label of the figure type object" do
    label = $figure_1.label
    label.should == 1
  end
  it "should return the major type subject term object" do
    subject = $figure_1.major_subject
    subject.label.should == "M"
  end
  it "should return the major type predicate term object" do
    subject = $figure_1.major_predicate
    subject.label.should == "P"
  end
  it "should return the minor type subject term object" do
    subject = $figure_1.minor_subject
    subject.label.should == "S"
  end
  it "should return the minor type predicate term object" do
    subject = $figure_1.minor_predicate
    subject.label.should == "M"
  end
end