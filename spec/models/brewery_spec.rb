require "rails_helper"

RSpec.describe Brewery do
  let(:brewery) { Brewery.new(name: "Bend", location: "Deschutes") }
  let(:brew) { Brew.new(abv: 0.068, ibus: 80, classification: "IPA") }

  it "knows that a brewery is a business" do
    expect(Brewery).to be < Business
  end

  it "considers a brewery with no beers to be out of stock" do
    expect(brewery).to be_out_of_stock
  end

  it "knows that a brewery with beers is not out of stock" do
    brewery.brews << brew
    expect(brewery).not_to be_out_of_stock
  end

  it "knows that a brewery has a location" do
    expect(brewery).to have_location
  end

  it "knows that a brewery has a name" do
    expect(brewery).to have_name
  end

end 