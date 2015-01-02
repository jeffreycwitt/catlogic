class Quantity
  attr_reader :label

  def initialize(quantity)
    @label = quantity
  end

  def opposite
    if self.label == 'universal'
      quantityopposite = Quantity.new('particular')
    elsif self.label == 'particular'
      quantityopposite = Quantity.new('universal')
    end
    return quantityopposite
  end
end