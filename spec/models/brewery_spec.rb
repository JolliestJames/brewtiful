require "rails_helper"

RSpec.describe Brewery do
  it "considers a brewery with no beers to be out of business" do
    brewery = Brewery.new
    expect(brewery.out_of_stock?).to be_truthy
  end
end 