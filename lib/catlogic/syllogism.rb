# Class for any syllogism object.
class Syllogism
  attr_reader :major, :minor, :conclusion

# Syllogism object initiation takes three Proposition objects

  def initialize(major, minor, conclusion=nil)
    @major = major
    @minor = minor
    if conclusion == nil
      @conclusion = self.getComputedConclusion
    else
      @conclusion = conclusion
    end
  end

# This method gets the middle term by looking for the term in the major and minor terms that are used twice.
  def middle
    termarray = [@major.subject.label, @major.predicate.label, @minor.subject.label, @minor.predicate.label]
    middle = nil
    if self.three_term?
      termarray.detect do |term|
        if termarray.count(term) == 2
          middle = Term.new(term)
        end
      end
    else
      middle = "Error: this is not a three term syllogism"
    end
    middle
  end

  def three_term?
    termarray = [@major.subject.label, @major.predicate.label, @minor.subject.label, @minor.predicate.label]
    if termarray.uniq.size == 3
      answer = true
    else
      answer = false
    end
  end



# gets the major term as a String from the major premise by identifying the middle term
# and then identifying the term in the premise that is not the middle

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

# returns the Mood object of Syllogism (e.g. AAA, EEE)

  def mood
    mood = Mood.new(@major.type, @minor.type, @conclusion.type)
    return mood
  end

# gets the Figure of Syllogism (e.g. 1, 2, 3, 4)

  def figure
    mjmp = @major.position_of_term(self.middle)
    mnmp = @minor.position_of_term(self.middle)

    if mjmp == 'subject' && mnmp == 'predicate'
      figure = Figure.new(1)
    elsif mjmp == 'predicate' && mnmp == 'predicate'
      figure = Figure.new(2)
    elsif mjmp == 	'subject' && mnmp == 'subject'
      figure = Figure.new(3)
    elsif mjmp == 'predicate' && mnmp == 'subject'
      figure = Figure.new(4)
    end
    return figure
  end

# Retrieve Form object of the Syllogism (i.e. AAAI, EAI4)
  def form
    form = Form.new(self.mood, self.figure)
    return form
  end

  def undistributed_middle_test
    ## Rule Number 1 - middle distributed
    if @major.distribution(@major.position_of_term(self.middle)).label == 'undistributed' && @minor.distribution(@minor.position_of_term(self.middle)).label == 'undistributed'
      validity = false
    else
      validity = true
    end
    return validity
  end

  def illicit_major_test
    ##Rule Number 2a distribution of major term
    if @conclusion.distribution('predicate').label == 'distributed' && @major.distribution(@major.position_of_term(self.majorterm)).label != 'distributed'
      validity = false
    else
      validity = true
    end
  end
  def illicit_minor_test
    ##Rule Number 2b distribution of minor term - check fallacy of illicit minor
    if @conclusion.distribution('subject').label == 'distributed' && @minor.distribution(@minor.position_of_term(self.minorterm)).label != 'distributed'
      validity = false
    else
      validty = true
    end
  end
  # exclusive premises
  def exclusive_premises_test
    if @major.quality.label == 'negative' && @minor.quality.label == 'negative'
      validity = false
    else
      validity = true
    end
  end

  def affirm_from_neg_test
    if (@major.quality.label == 'negative' || @minor.quality.label == 'negative') && @conclusion.quality.label != 'negative'
      validity = false
    else
      validity = true
    end
  end

  def neg_from_affirms_test
    if (@conclusion.quality.label == 'negative' && (@major.quality.label != 'negative' && @minor.quality.label != 'negative'))

      validity = false
      #validity = "pass"
    else
      validity = true
    end
  end


  def validity
    if (self.undistributed_middle_test != true || self.illicit_major_test != true || self.illicit_minor_test != true || self.exclusive_premises_test != true || self.affirm_from_neg_test != true || self.neg_from_affirms_test != true)
      validity = false
    else
      validity = true
    end
  end

  def label
    return "#{@major.label}\n#{@minor.label}\n#{@conclusion.label}"
  end



  

  

  def displayPropositionalForm
    form = Form.new(self.mood, self.figure)
    form.displayPropositionalForm
  end
end