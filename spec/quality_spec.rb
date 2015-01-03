require 'spec_helper'
require 'catlogic'

describe 'quality object' do
  it 'can return quality as string' do
    quality = Catlogic::Quality.new('affirmative')
    result = quality.label
    result.should == 'affirmative'
  end

  it 'can return term opposite as string' do
    quality = Catlogic::Quality.new('affirmative')
    opposite = quality.opposite
    result = opposite.label
    result.should == 'negative'
  end
end