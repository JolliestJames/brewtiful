require "rails_helper"

RSpec.describe CreatesBrewery do
  it "creates a brewery given a name and a location" do
    creator = CreatesBrewery.new(name: "Deschutes Brewery", location: "Bend, OR")
    creator.build
    expect(creator.brewery.name).to eq("Deschutes Brewery")
    expect(creator.brewery.location).to eq("Bend, OR")
  end
end