module Catlogic
  class Proposition

    attr_reader :quantity, :subject, :quality, :predicate, :truthvalue

    def initialize(quantity, subject, quality, predicate, truthvalue=true)
      @quantity=quantity.to_quantity
      @subject=subject.to_term
      @quality=quality.to_quality
      @predicate=predicate.to_term
      @truthvalue=truthvalue
    end

    def type
      if @quantity.label == 'universal' && @quality.label == 'affirmative'
        @type=PropositionType.new("A")
      elsif @quantity.label == 'universal' && @quality.label == 'negative'
        @type=PropositionType.new("E")
      elsif @quantity.label == 'particular' && @quality.label == 'affirmative'
        @type=PropositionType.new("I")
      elsif @quantity.label == 'particular' && @quality.label == 'negative'
        @type=PropositionType.new("O")
      end
      return @type
    end

    def contradictory

      quantity = @quantity.opposite
      quality = @quality.opposite

      @contradictory = Proposition.new(quantity, @subject, quality, @predicate, !@truthvalue)
      return @contradictory
    end

    def subaltern

      quantity = @quantity.opposite

      if @quantity.label == "universal"
        if @truthvalue
          truthvalue = @truthvalue
        elsif !@truthvalue
          truthvalue = "unknown"
        end
      elsif @quantity.label == "particular"
        if !@truthvalue
          truthvalue = !@truthvalue
        elsif @truthvalue
          truthvalue = "unknown"
        end
      end

      @subaltern = Proposition.new(quantity, @subject, @quality, @predicate, truthvalue)
      return @subaltern
    end

    def contrary
      if @quantity.label  == "particular"
        abort("There is no contrary for this type of propostion. Try subcontrary")
      end
      quality = @quality.opposite

      if @truthvalue
        truthvalue = !@truthvalue
      elsif !@truthvalue
        truthvalue = "unknown"
      end

      contrary = Proposition.new(@quantity, @subject, quality, @predicate, truthvalue)
      return contrary
    end

    def subcontrary
      if @quantity.label  == "universal"
        abort("There is no subcontrary for this type of propostion. Try contrary.")
      end

      quality = @quality.opposite

      if !@truthvalue
        truthvalue = !@truthvalue
      elsif @truthvalue
        truthvalue = "unknown"
      end

      subcontrary = Proposition.new(@quantity, @subject, quality, @predicate, truthvalue)
      return subcontrary
    end

    def converse
      if self.type.label == "A" || self.type.label == "O"
        truthvalue = "unknown"
      else
        truthvalue = @truthvalue
      end
      @converse = Proposition.new(@quantity, @predicate, @quality, @subject, truthvalue)
    end

    def obverse
      quality = @quality.opposite

      predicate = @predicate.opposite
      @obverse = Proposition.new(@quantity, @subject, quality, predicate, @truthvalue)
    end

    def contrapolated
      if self.type.label == "E" || self.type.label == "I"
        truthvalue = "unknown"
      else
        truthvalue = @truthvalue
      end
      subject = @subject.opposite
      predicate = @predicate.opposite

      @contrapolated = Proposition.new(@quantity, predicate, @quality, subject, truthvalue)

    end

    def position_of_term(term)
      if self.subject.label == term.label
        @positionofmiddle = 'subject'
      elsif self.predicate.label == term.label
        @positionofmiddle = 'predicate'
      end
      return @positionofmiddle
    end

    def label
      if @quantity.label == "universal"
        if @quality.label == "affirmative"
          display_quantity = "All"
          display_quality = "are"
        elsif @quality.label == "negative"
          display_quantity = "No"
          display_quality = "are"
        end
      elsif @quantity.label == "particular"
        if @quality.label == "affirmative"
          display_quantity = "Some"
          display_quality = "are"
        elsif @quality.label == "negative"
          display_quantity = "Some"
          display_quality = "are not"
        end
      end
      "#{display_quantity} #{@subject.label} #{display_quality} #{@predicate.label}"
    end

    def distribution(position)
      if position == 'subject'
        distribution = @subject.distribution_subject(@quantity)
      elsif position == 'predicate'
        distribution = @predicate.distribution_predicate(@quality)
      end
      return distribution
    end

    def same_as?(proposition)
      if (proposition.quantity.label == self.quantity.label &&
          proposition.subject.label == self.subject.label &&
          proposition.quality.label == self.quality.label &&
          proposition.predicate.label == self.predicate.label &&
          proposition.truthvalue == self.truthvalue)
        true
      else
        false
      end
    end

    def unique?(set)
      numerofoccurences = self.number_of_occurences(set)
      if numerofoccurences == 0
        true
      else
        false
      end
    end

    def number_of_occurences(set)
      @occurences = 0
      set.each do |proposition|
        if self.same_as?(proposition)
          @occurences += 1
        end
      end
      @occurences
    end
  end
end

