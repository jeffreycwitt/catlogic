module Catlogic
  class PropositionType

    attr_reader :label, :truthvalue

    def initialize(type, truthvalue=true)
      @type = type
      @label = type
      @truthvalue = truthvalue
    end
    def to_proposition_type
      self
    end

    def quantity
      if @label == "A"
        quantity = Quantity.new("universal")
      elsif @label == "E"
        quantity = Quantity.new("universal")
      elsif @label == "I"
        quantity = Quantity.new("particular")
      elsif @label == "O"
        quantity = Quantity.new("particular")
      else
        quantity = "not a valid type"
      end
      return quantity
    end
    def quality
      if @label == "A"
        quality = Quality.new("affirmative")
      elsif @label == "E"
        quality = Quality.new("negative")
      elsif @label == "I"
        quality = Quality.new("affirmative")
      elsif @label == "O"
        quality = Quality.new("negative")
      else
        quality = "not a valid type"
      end
      return quality
    end

    def proposition
      proposition = Proposition.new(Quantity.new(self.quantity.label), Term.new("S"), Quality.new(self.quality.label), Term.new("P"), @truthvalue)
      return proposition
    end

  end
end

