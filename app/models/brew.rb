class Brew
  def initialize
    @consumed = false
    @concocted = false
    @abv = nil
    @ibu = nil
    @classification = nil
  end
  def mark_consumed
    @consumed = true
  end
  def consumed?
    @consumed
  end
  def mark_concocted
  	@concocted = true
  end
  def concocted?
  	@concocted
  end
  def concoct abv, ibu, classification
  	@abv = abv
  	@ibu = ibu
  	@classification = classification
  	mark_concocted
  end
end