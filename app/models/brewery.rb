class Brewery < ApplicationRecord
  has_many :brews, dependent: :destroy
  validates :name, presence: true
  validates :location, presence: true

  def out_of_stock?
    self.brews.empty?
  end

  def most_bitter_brew
    most_bitter_brew = nil
    most_bitter_brew = self.brews.max_by { |brew| brew.ibus }
    most_bitter_brew
  end

  def least_bitter_brew
    least_bitter_brew = nil
    least_bitter_brew = self.brews.min_by { |brew| brew.ibus }
    least_bitter_brew
  end

  def strongest_brew
    strongest_brew = nil
    strongest_brew = self.brews.max_by { |brew| brew.abv }
    strongest_brew
  end

  def weakest_brew
    least_abv_brew = nil
    least_abv_brew = self.brews.min_by { |brew| brew.abv }
    least_abv_brew
  end

end