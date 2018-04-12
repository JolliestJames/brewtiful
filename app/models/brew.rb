class Brew

  MAX_LOCAL_DISTANCE = 50
  
  def initialize
    @consumed = false
    @concocted = false
    @abv = "0"
    @ibu = 0
    @classification = "none"
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
  
  def concoct(abv, ibu, classification)
    @abv = abv
    @ibu = ibu
    @classification = classification
    mark_concocted
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