require "rails_helper"

RSpec.describe CreatesBrew do

  let(:creator) { CreatesBrew.new(
    name: name, abv: abv, ibus: ibus, classification: classification) }

  describe "initialization" do
    let(:name) { "Obsidian Stout" } 
    let(:abv) { 0.07 } 
    let(:ibus) { 70 }
    let(:classification) { "Stout" }
    it "creates a brew given a name, an abv percentage, an ibu amount, and a classification" do
      creator.build
      expect(creator.brew.name).to eq("Obsidian Stout")
      expect(creator.brew.abv).to eq(0.07)
      expect(creator.brew.ibus).to eq(70)
      expect(creator.brew.classification).to eq("Stout")
    end
  end

end