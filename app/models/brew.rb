class Brew < ApplicationRecord
  belongs_to :brewery
  has_and_belongs_to_many :pubs
  validates :name, presence: true
  validates :abv, presence: true
  validates :ibus, presence: true
  validates :classification, presence: true
  
  MAX_LOCAL_DISTANCE = 50
 
  def consume
    self.consumed = true
  end
   
  def is_local(miles_from_brewery)
    miles_from_brewery < MAX_LOCAL_DISTANCE
  end

  def perform(big_brew_dependency)
    big_brew_dependency.execute
    42
  end
  
end