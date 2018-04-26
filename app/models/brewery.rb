class Brewery < ApplicationRecord
  has_many :brews, dependent: :destroy
  validates :name, presence: true
  validates :location, presence: true

  def out_of_stock?
    self.brews.empty?
  end

  def most_bitter_brew
    self.brews.max_by { |brew| brew.ibus }
  end

  def least_bitter_brew
    self.brews.min_by { |brew| brew.ibus }
  end

  def strongest_brew
    self.brews.max_by { |brew| brew.abv }
  end

  def weakest_brew
    self.brews.min_by { |brew| brew.abv }
  end

end