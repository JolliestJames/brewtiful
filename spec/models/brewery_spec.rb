require "rails_helper"

RSpec.describe Brewery do
  let(:brewery) { Brewery.new("Bend", "Deschutes") }
  let(:brew) { Brew.new }

  it "considers a brewery with no beers to be out of stock" do
    expect(brewery).to be_out_of_stock
  end

  it "knows that a brewery with beers is not out of stock" do
    brewery.brews << brew
    expect(brewery).not_to be_out_of_stock
  end

  it "knows that a brewery has a location" do
    expect(brewery.has_location?).to be true
  end

  it "knows that a brewery has a name" do
    expect(brewery.has_name?).to be true
  end

end 