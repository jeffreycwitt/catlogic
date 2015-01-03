class PremiseCollection
  attr_reader :initial_propositions, :unique_propositions

  def initialize(propositionarray)
    @initial_propositions = propositionarray
    @unique_propositions = self.unique_set
  end

  def at_least_two?

    if @unique_propositions.count >= 2
      true
    else
      false
    end
  end
  def size
    @unique_propositions.count
  end
  def initial_size
    @initial_propositions.count
  end
  def unique_set
    unique_set = []
    @initial_propositions.each do |conclusion|
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
      @unique_propositions.each do |proposition|
        @unique_propositions.each do |secondproposition|
        unless proposition.same_as?(secondproposition)
          pairs << PremisePair.new(proposition, secondproposition)
        end
      end
    end
    return pairs
  end
  def three_term_premise_pairs
    total_pairs = self.premise_pairs
    three_term_pairs = []
    total_pairs.each do |pair|
      if pair.three_term_pair?
        three_term_pairs << pair
      end
    end
    return three_term_pairs 
  end

  def valid_syllogisms
    validsyllogisms = []
    three_term_pairs = self.three_term_premise_pairs
    three_term_pairs.each do |pair|
      conclusions = pair.possible_conclusions
      conclusions.each do |conclusion|
        syllogism = Syllogism.new(pair.major, pair.minor, conclusion)
        if syllogism.validity == true
          validsyllogisms << syllogism
        end
      end
    end
    return validsyllogisms
  end

# next three functions work together
# first gets all new truths
  def inferred_truths_all
    inferred_truths_all = []
    validsyllogisms = self.valid_syllogisms
    validsyllogisms.each do |syllogism|
      inferred_truths_all << syllogism.conclusion
    end
    return inferred_truths_all
  end
# next it reduces the inferred set to unique propositions and removes duplicates
  def inferred_truths_unique
    inferred_truths_all = self.inferred_truths_all
    inferredcollection = PremiseCollection.new(inferred_truths_all)
    inferred_truths_unique = inferredcollection.unique_propositions
    return inferred_truths_unique
  end
#finally it checks the new set against the initial set and removes already know truths
  def inferred_truths_new
    inferred_truths_new = []
    inferred_truths_unique = self.inferred_truths_unique
    inferred_truths_unique.each do |proposition|
      if proposition.unique?(@unique_propositions)
        inferred_truths_new << proposition
      end
    end
    return inferred_truths_new
  end
end

