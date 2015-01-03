class PremisePair
  
  attr_reader :major, :minor
  
  def initialize(major, minor)
    @major = major
    @minor = minor
  end

  def middle
    termarray = [@major.subject.label, @major.predicate.label, @minor.subject.label, @minor.predicate.label]
    middle = nil
    if self.three_term_pair?
      termarray.detect do |term|
        if termarray.count(term) == 2
          middle = Term.new(term)
        end
      end
    else
      middle = "Error: this is not a three term syllogism"
    end
    return middle
  end

  def three_term_pair?
    termarray = [@major.subject.label, @major.predicate.label, @minor.subject.label, @minor.predicate.label]
    if termarray.uniq.size == 3
      answer = true
    else
      answer = false
    end
  end

   def majorterm
    if @major.subject.label == self.middle.label
      majorterm = @major.predicate
    else
      majorterm = @major.subject
    end
    majorterm
  end
  def minorterm
    if @minor.subject.label == self.middle.label
      minorterm = @minor.predicate
    else
      minorterm = @minor.subject
    end
    minorterm
  end

# still need a test for this
  def possible_conclusions
    possible_conclusions = [
        Proposition.new(Quantity.new("universal"), self.minorterm, Quality.new("affirmative"), self.majorterm, true),
        Proposition.new(Quantity.new("universal"), self.minorterm, Quality.new("negative"), self.majorterm, true),
        Proposition.new(Quantity.new("particular"), self.minorterm, Quality.new("affirmative"), self.majorterm, true),
        Proposition.new(Quantity.new("particular"), self.minorterm, Quality.new("negative"), self.majorterm, true)
    ]
    return possible_conclusions
  end

end