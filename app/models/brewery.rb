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

end