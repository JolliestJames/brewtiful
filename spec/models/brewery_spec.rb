require "rails_helper"

RSpec.describe Brewery do
  let(:brewery) { Brewery.new }
  let(:brew) { Brew.new }

  it "considers a brewery with no beers to be out of stock" do
    expect(brewery.out_of_stock?).to be_truthy
  end

  it "knows that a brewery with beers is not out of stock" do
    brewery.brews << brew
    expect(brewery.out_of_stock?).to be_falsy
  end
  
end 