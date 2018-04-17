require "rails_helper"

RSpec.describe CreatesBrewery do

  let(:creator) { CreatesBrewery.new(
    name: name, location: location
  )}

  describe "initialization" do
    let(:name) {"Deschutes Brewery"}
    let(:location) {"Bend, OR"}
    it "creates a brewery given a name and a location" do
      creator.build
      expect(creator.brewery.name).to eq("Deschutes Brewery")
      expect(creator.brewery.location).to eq("Bend, OR")
    end
  end

  describe "failure cases" do
    let(:name) {""}
    let(:location) {"Bend, OR"}
    it "fails when trying to save a brewery with no name" do
      creator.create
      expect(creator).not_to be_a_success
    end
  end

end