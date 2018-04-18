class Brew < ApplicationRecord
  belongs_to :brewery
  has_and_belongs_to_many :pubs
  validates :name, presence: true

  MAX_LOCAL_DISTANCE = 50
 
  def mark_consumed
    self.consumed = true
  end
    
  def consumed?
    self.consumed
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