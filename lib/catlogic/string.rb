class String
  def to_proposition_type
    Catlogic::PropositionType.new(self)
  end

  def to_quantity
    Catlogic::Quantity.new(self)
  end
  def to_quality
    Catlogic::Quality.new(self)
  end
  def to_term
    Catlogic::Term.new(self)
  end

  def to_mood
    Catlogic::Mood.new(self[0], self[1], self[2])
  end

end