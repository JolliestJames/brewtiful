require "rails_helper"

RSpec.describe Brewery do
  let(:brewery) { Brewery.new("Bend", "Deschutes") }
  let(:brew) { Brew.new }

  it "knows that a brewery is a business" do
    expect(Pub).to be < Business
  end

  it "considers a brewery with no beers to be out of stock" do
    expect(brewery).to be_out_of_stock
  end

  it "knows that a brewery with beers is not out of stock" do
    brewery.brews << brew
    expect(brewery).not_to be_out_of_stock
  end

end 