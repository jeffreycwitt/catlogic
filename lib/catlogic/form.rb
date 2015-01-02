class Form
  attr_reader :mood, :figure, :label
  # takes three Mood Object and Figure Object
  def initialize(mood, figure)
    @mood = mood
    @figure = figure
    @label = "#{@mood.label}#{@figure.label}"
  end
  def syllogism
     majorproposition = Proposition.new(@mood.majortype.quantity, @figure.major_subject, @mood.majortype.quality, @figure.major_predicate, true)
    minorproposition = Proposition.new(@mood.minortype.quantity, @figure.minor_subject, @mood.minortype.quality, @figure.minor_predicate, true)
    conclusion = Proposition.new(@mood.conclusiontype.quantity, Term.new("S"), @mood.conclusiontype.quality, Term.new("P"), true)

    syllogism = Syllogism.new(majorproposition, minorproposition, conclusion)

    return syllogism
  end
  def validity
    syllogism = self.syllogism
    syllogism.validity
  end
end