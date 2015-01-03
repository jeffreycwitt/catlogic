module Catlogic
  class Distribution
    attr_reader :label

    def initialize(distribution)
      @label = distribution
    end

    def opposite
      if self.label == 'distributed'
        opposite = Distribution.new('undistributed')
      elsif self.label == 'undistributed'
        opposite = Distribution.new('distributed')
      end
      return opposite
    end
  end
end