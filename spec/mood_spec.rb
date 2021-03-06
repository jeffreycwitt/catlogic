require "spec_helper"
require "catlogic"

describe "mood object" do

  $moodobject_aaa = Catlogic::Mood.new(Catlogic::PropositionType.new('A'), Catlogic::PropositionType.new('A'), Catlogic::PropositionType.new('A'))

  it 'can display the label of the mood object' do
    mood = $moodobject_aaa.label
    mood.should == 'AAA'
  end

  it 'can get the major type proposition' do
    majortype = $moodobject_aaa.majortype
    majortype.label.should === 'A'
  end
end