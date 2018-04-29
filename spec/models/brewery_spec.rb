require "rails_helper"

RSpec.describe Brewery do
  let(:brewery) { Brewery.new(name: "Deschutes Brewery", location: "Bend") }
  let(:brew) { Brew.new(name: "The Abyss", abv: 0.11, ibus: 30, classification: "Imperial Stout") }
  
  it "considers a brewery with no beers to be out of stock" do
    expect(brewery).to be_out_of_stock
  end

  it "knows that a brewery with beers is not out of stock" do
    brewery.brews << brew
    expect(brewery).not_to be_out_of_stock
  end

  it "knows that a brewery has a location" do
    expect(brewery.location).not_to be_nil
  end

  it "knows that a brewery has a name" do
    expect(brewery.name).not_to be_nil
  end

  let(:low_ibus) { Brew.new(name: "The Abyss", abv: 0.11, ibus: 30, classification: "Imperial Stout") }
  let(:med_ibus) { Brew.new(name: "Mirror Pond Pale Ale", abv: 0.05, ibus: 40, classification: "Imperial Stout") }
  let(:high_ibus) { Brew.new(name: "Red Chair Pale Ale", abv: 0.062, ibus: 60, classification: "North West Pale Ale") }

  it "knows that a brewery knows which of its brews is most bitter" do
    brewery.brews = [low_ibus, med_ibus, high_ibus]
    expect(brewery.most_bitter_brew).to be_brew(high_ibus)
  end

  it "knows that a brewery with no brews has no brew which is most bitter" do
    expect(brewery.most_bitter_brew).to be_nil
  end

  it "knows that a brewery knows which of its brews is least bitter" do
    brewery.brews = [low_ibus, med_ibus, high_ibus]
    expect(brewery.least_bitter_brew).to be_brew(low_ibus)
  end
  
  it "knows that a brewery with no brews has no brew which is least bitter" do
    expect(brewery.least_bitter_brew).to be_nil
  end

  let(:high_abv) { Brew.new(name: "The Abyss", abv: 0.11, ibus: 30, classification: "Imperial Stout") }
  let(:low_abv) { Brew.new(name: "Mirror Pond Pale Ale", abv: 0.05, ibus: 40, classification: "Imperial Stout") }
  let(:med_abv) { Brew.new(name: "Red Chair Pale Ale", abv: 0.062, ibus: 60, classification: "North West Pale Ale") }

  it "knows that a brewery knows which of its brews is the strongest" do
    brewery.brews = [low_abv, med_abv, high_abv]
    expect(brewery.strongest_brew).to be_brew(high_abv)
  end

  it "knows that a brewery with no brews does not have a strongest brew" do
    expect(brewery.strongest_brew).to be_nil
  end

  it "knows that a brewery knows which of its brews is the weakest" do
    brewery.brews = [low_abv, med_abv, high_abv]
    expect(brewery.weakest_brew).to be_brew(low_abv)
  end

  it "knows that a brewery with no brews does not have a weakest brew" do
    expect(brewery.weakest_brew).to be_nil
  end

end 