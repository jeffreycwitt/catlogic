class PremiseCollection
  def initialize(propositionarray)
    @collection_array = propositionarray
  end

  def at_least_two?
    if @collection_array.count >= 2
      true
    else
      false
    end
  end
  def size
    @collection_array.count
  end
  def unique_set
    unique_set = []
    @collection_array.each do |conclusion|
      if unique_set.count == 0
        unique_set << conclusion
      elsif conclusion.unique?(unique_set)
        unique_set << conclusion
      end
    end
    return unique_set
  end
  def premise_pairs
    pairs = []
      @collection_array.each do |proposition|
        @collection_array.each do |secondproposition|
        unless proposition.same_as?(secondproposition)
          pairs << PremisePair.new(proposition, secondproposition)
        end
      end
    end
  end
end

