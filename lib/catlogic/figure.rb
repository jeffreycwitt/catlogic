class Figure
  attr_reader :label

  def initialize(figure)
    @label = figure
  end


  def major_subject
    if @label == 1 || @label == 3
      subject = Term.new('M')

    elsif @label == 2 || @label == 4
      subject = Term.new('P')
    end
    return subject
  end

  def major_predicate
    if @label == 1 || @label == 3
      predicate = Term.new("P")
    elsif @label == 2 || @label == 4
      predicate = Term.new("M")
    end
    return predicate
  end
  def minor_subject
    if @label == 1 || @label == 2
      subject = Term.new("S")

    elsif @label == 3 || @label == 4
      subject = Term.new("M")

    end
    return subject
  end
  def minor_predicate
    if @label == 1 || @label == 2
      predicate = Term.new("M")
    elsif @label == 3 || @label == 4
      predicate = Term.new("S")
    end
    return predicate
  end
end