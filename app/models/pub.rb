class Pub < ApplicationRecord
  has_and_belongs_to_many :brews

  validates :name, presence: true

  def has_location?
    location
  end

  def has_name?
    name
  end

  def has_an_empty_tap_list?
    self.tap_list.empty?
  end

  def tap_list
    self.brews
  end

  def patronize(drink_beer)
    drink_beer.nurse
    return 42
  end

  def replace_empty_keg(replace_keg)
    replace_keg.replace
    return true
  end

end