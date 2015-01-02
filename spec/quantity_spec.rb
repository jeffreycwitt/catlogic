require 'spec_helper'
require 'catlogic'
require 'pry'

describe 'quantity object' do
  it 'can return quantity as string' do
    quantity = Quantity.new('universal')
    result = quantity.label
    result.should == 'universal'
  end

  it 'can return term opposite as string' do
    quantity = Quantity.new('particular')
    opposite = quantity.opposite
    result = opposite.label

    result.should == 'universal'
  end
end