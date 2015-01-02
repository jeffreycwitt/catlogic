require 'spec_helper'
require 'catlogic'
require 'pry'

describe 'distribution object' do
  it 'can return distribution label as string' do
    term = Distribution.new('distributed')
    result = term.label
    result.should == 'distributed'
  end

  it 'can return distribution opposite label as string' do
    term = Distribution.new('distributed')
    opposite = term.opposite
    result = opposite.label
    result.should == 'undistributed'
  end

  it 'can return undistributed opposite label as string' do
    term = Distribution.new('undistributed')
    opposite = term.opposite
    result = opposite.label
    result.should == 'distributed'
  end

end