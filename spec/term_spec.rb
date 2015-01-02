require 'spec_helper'
require 'catlogic'
require 'pry'

describe 'term object' do
  it 'can return term as string' do
    term = Term.new('dogs')
    result = term.label
    result.should == 'dogs'
  end

  it 'can return term opposite as string' do
    term = Term.new('dogs')
    opposite = term.opposite
    result = opposite.label
    result.should == 'non-dogs'
  end

  it 'can return correct distribution for subject term' do
    term = Term.new('dogs')
    quantity = Quantity.new('universal')
    result = term.distribution_subject(quantity)
    result.label.should == 'distributed'
  end

  it 'can return correct distribution for predicate term' do
    term = Term.new('dogs')
    quality = Quality.new('affirmative')
    result = term.distribution_predicate(quality)
    result.label.should == 'undistributed'
  end



end