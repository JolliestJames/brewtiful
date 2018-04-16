class Brew

  MAX_LOCAL_DISTANCE = 50
  
  def initialize(abv, ibu, classification)
    @consumed = false
    @concocted = false
    @abv = abv
    @ibu = ibu
    @classification = classification
  end
  
  def mark_consumed
    @consumed = true
  end
    
  def consumed?
    @consumed
  end
    
  def mark_local
    @local = true
  end
  
  def local?
    @local
  end
  
  def is_local(miles_from_brewery)
    if miles_from_brewery < MAX_LOCAL_DISTANCE
      mark_local
    end
  end
  
end