class Term
  attr_reader :label

  def initialize(termname)
    @label = termname
  end

  def opposite
    opposite = Term.new("non-#{@label}")
    return opposite
  end

  def distribution_subject(quantity)
      if quantity.label == 'universal'
        @distribution = Distribution.new('distributed')
      elsif quantity.label == 'particular'
        @distribution = Distribution.new('undistributed')
      end
    return @distribution

  end

  def distribution_predicate(quality)
    if quality.label == 'affirmative'
      @distribution = Distribution.new('undistributed')
    elsif quality.label == 'negative'
      @distribution = Distribution.new('distributed')
    end
    return @distribution
  end

  end
