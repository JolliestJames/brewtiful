require "rails_helper"

class FakeBigBrewDependency

  def execute
  end

end

RSpec.describe Brew do
  let(:brew) { FactoryBot.build_stubbed(:brew) }

  it "does not have a new brew as consumed" do
    expect(brew).not_to be_consumed
  end

  it "allows us to consume a brew" do
    brew.consume
    expect(brew).to be_consumed
  end

  it "knows if a brew is local" do
    expect(brew.is_local(5)).to be true
  end

  # it "can perform an execution on a big brew dependency" do
  #   big_brew_dependency = BigBrewDependency.new
  #   expect(brew.perform(big_brew_dependency)).to eq(42)
  # end

  it "can perform an execution on a big brew dependency" do
    fake_big_brew_dependency = FakeBigBrewDependency.new
    expect(brew.perform(fake_big_brew_dependency)).to eq(42)
  end
  
  describe "test doubles" do

    it "stubs an object" do
      expect(brew).to receive(:name).and_return("Brewtiful")
      expect(brew.name).to eq("Brewtiful")
    end

    #Is the difference between the mock and the stub simply that we must mock every method?

    it "mocks an object" do
      expect(brew).to receive(:name).and_return("Brew stub")
      expect(brew).to receive(:abv).and_return(0.12)
      expect(brew).to receive(:ibus).and_return(100.00)
      expect(brew).to receive(:classification).and_return("Classification stub")
      expect(brew).to receive(:brewery_id).and_return(1)
      expect(brew.name).to eq("Brew stub")
      expect(brew.abv).to eq(0.12)
      expect(brew.ibus).to eq(100)
      expect(brew.classification).to eq("Classification stub")
      expect(brew.brewery_id).to eq(1)
    end

    it "stubs the class" do
      allow(Brew).to receive(:find).and_return(
        Brew.new(
          name: "Stubbed brew",
          abv: 0.99,
          ibus: 1000.00,
          classification: "Stubbed classification",
          brewery_id: 1
        )
      )
      brew = Brew.find(1)
      expect(brew.name).to eq("Stubbed brew")
      expect(brew.abv).to eq(0.99)
      expect(brew.ibus).to eq(1000.00)
      expect(brew.classification).to eq("Stubbed classification")
      expect(brew.brewery_id).to eq(1)
    end

  end

end