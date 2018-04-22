require "rails_helper"

RSpec.describe Brewery do
  let(:brewery) { Brewery.new(name: "Deschutes Brewery", location: "Bend") }
  let(:brew) { Brew.new(name: "The Abyss", abv: 0.068, ibus: 80, classification: "Imperial Stout") }

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

end 