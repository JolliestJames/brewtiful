require "rails_helper"

class FakeDrinkBeer

  def nurse
  end

end

class FakeReplaceKeg

  def replace
  end

end

RSpec.describe Pub do
  let(:pub) { Pub.new(location: "Redmond", name:"The Beer Stop") }
  let(:brew) { Brew.new(name: "Hopsmack", abv: 0.068, ibus: 80, classification: "IPA") }

  it "knows that a pub must have at least one brew on tap" do
    pub.tap_list << brew
    expect(pub).not_to have_an_empty_tap_list
  end

  it "knows that a pub has a location" do
    expect(pub).to have_location
  end

  it "knows that a pub has a name" do
    expect(pub).to have_name
  end

  # it "drinks a beer slowly" do
  #   expect(pub.patronize(DrinkBeer.new)).to be 42
  # end

  it "drinks a beer slowly" do
    expect(pub.patronize(FakeDrinkBeer.new)).to eq(42)
  end

  # it "replaces an empty keg" do
  #   expect(pub.replace_empty_keg(ReplaceKeg.new)).to eq(true)
  # end

  it "replaces an empty keg" do
    expect(pub.replace_empty_keg(FakeReplaceKeg.new)).to eq(true)
  end

end