class Brew

	MAX_DISTANCE_CONST = 50
  
  def initialize
    @consumed = false
    @concocted = false
    @local = false
    @abv = nil
    @ibu = nil
    @classification = nil
    @miles = 0
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
  
  def mark_local
  	@local = true
  end
  
  def local?
  	@local
	end
  
  def is_local miles
  	@miles = miles
  	if miles < MAX_DISTANCE_CONST
  		mark_local
  	end
  end
  
end