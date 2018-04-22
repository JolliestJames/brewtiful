class Brewery < ApplicationRecord
  has_many :brews, dependent: :destroy
  validates :name, presence: true
  validates :location, presence: true

  def out_of_stock?
    self.brews.empty?
  end

end