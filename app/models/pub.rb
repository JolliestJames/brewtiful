class Pub < Business
  has_and_belongs_to_many :brews

  validates :name, presence: true

  def has_location?
    location
  end

  def has_name?
    name
  end

  def has_an_empty_tap_list?
    brews.empty?
  end

end