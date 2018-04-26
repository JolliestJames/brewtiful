require "rails_helper"

RSpec.describe Brewery do
  let(:brewery) { Brewery.new(name: "Deschutes Brewery", location: "Bend") }
  let(:brew) { Brew.new(name: "The Abyss", abv: 0.11, ibus: 30, classification: "Imperial Stout") }
  let(:brew2) { Brew.new(name: "Mirror Pond Pale Ale", abv: 0.05, ibus: 40, classification: "Imperial Stout") }
  let(:brew3) { Brew.new(name: "Red Chair Pale Ale", abv: 0.062, ibus: 60, classification: "North West Pale Ale") }

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

  it "knows that a brewery knows which of its brews is most bitter" do
    brewery.brews << brew
    brewery.brews << brew2
    brewery.brews << brew3
    expect(brewery.most_bitter_brew).to eq(brew3)
  end

  it "knows that a brewery with no brews has no brew which is most bitter" do
    expect(brewery.most_bitter_brew).to be_nil
  end

  it "knows that a brewery knows which of its brews is least bitter" do
    brewery.brews << brew
    brewery.brews << brew2
    brewery.brews << brew3
    expect(brewery.least_bitter_brew).to eq(brew)
  end
  
  it "knows that a brewery with no brews has no brew which is least bitter" do
    expect(brewery.least_bitter_brew).to be_nil
  end

  it "knows that a brewery knows which of its brews is the strongest" do
    brewery.brews << brew
    brewery.brews << brew2
    brewery.brews << brew3
    expect(brewery.strongest_brew).to eq(brew)
  end

  it "knows that a brewery with no brews does not have a strongest brew" do
    expect(brewery.strongest_brew).to eq(nil)
  end

  it "knows that a brewery knows which of its brews is the weakest" do
    brewery.brews << brew
    brewery.brews << brew2
    brewery.brews << brew3
    expect(brewery.weakest_brew).to eq(brew2)
  end

  it "knows that a brewery with no brews does not have a weakest brew" do
    expect(brewery.weakest_brew).to eq(nil)
  end

end 