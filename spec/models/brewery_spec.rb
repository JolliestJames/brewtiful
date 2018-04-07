require "rails_helper"

RSpec.describe Brewery do
  it "considers a brewery with no beers to be out of stock" do
    brewery = Brewery.new
    expect(brewery.out_of_stock?).to be_truthy
  end

  it "knows that a brewery with beers is not out of stock" do
    brewery = Brewery.new
    brew = Brew.new
    brewery.brews << brew
    expect(brewery.out_of_stock?).to be_falsy
  end
end 