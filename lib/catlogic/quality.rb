module Catlogic
  class Quality
    attr_reader :label

    def initialize(quality)
      @label = quality
    end

    def opposite
      if self.label == 'negative'
        qualityopposite = Quality.new('affirmative')
      elsif self.label == 'affirmative'
        qualityopposite = Quality.new('negative')
      end
      return qualityopposite
    end

    def to_quality
      self
    end
  end
end