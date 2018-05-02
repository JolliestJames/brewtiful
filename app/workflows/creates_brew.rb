class CreatesBrew
  attr_accessor :brew, :name, :abv, :ibus, :classification, :brewery_id

  def initialize(name: "", abv: nil, ibus: nil, classification: "", brewery_id: nil)
    @name = name
    @abv = abv
    @ibus = ibus
    @classification = classification
    @success = false
    @brewery_id = brewery_id
  end

  def success?
    @success
  end

  def build
    self.brew = Brew.new(
      name: name, 
      abv: abv, 
      ibus: ibus, 
      classification: classification,
      brewery_id: brewery_id)
    brew
  end

  def create
    build
    result = brew.save
    @success = result
  end

end