class CreatesBrew
  attr_accessor :name, :abv, :ibus, :classification

  def initialize(name: "", abv: nil, ibus: nil, classification: "")
    @name = name
    @abv = abv
    @ibus = ibus
    @classification = classification
  end

end