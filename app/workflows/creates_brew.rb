class CreatesBrew
  attr_accessor :brew, :name, :abv, :ibus, :classification

  def initialize(name: "", abv: nil, ibus: nil, classification: "")
    @name = name
    @abv = abv
    @ibus = ibus
    @classification = classification
    @success = false
  end

  def success?
    @success
  end

  def build
    self.brew = Brew.new(
      name: name, 
      abv: abv, 
      ibus: ibus, 
      classification: classification)
    brew
  end

  def create
    build
    result = brew.save!
    @success = result
  end

end