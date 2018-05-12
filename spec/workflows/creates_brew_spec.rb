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

  describe "failure cases" do

    describe "fails when trying to save a brew with no name" do
      let(:name) {""}
      let(:abv) { 0.07 }
      let(:ibus) { 70 }
      let(:classification) { "Stout" }
      specify { creator.create; expect(creator).not_to be_a_success }
    end

    describe "fails when trying to save a brew with no abv" do
      let(:name) {"Obsidian Stout"}
      let(:abv) { nil }
      let(:ibus) { 70 }
      let(:classification) { "Stout" }
      specify { creator.create; expect(creator).not_to be_a_success }
    end

    describe "fails when trying to save a brew with no ibus" do
      let(:name) {"Obsidian Stout"}
      let(:abv) { 0.07 }
      let(:ibus) { nil }
      let(:classification) { "Stout" }
      specify { creator.create; expect(creator).not_to be_a_success }
    end

    describe "fails when trying to save a brew with no classification" do
      let(:name) {"Obsidian Stout"}
      let(:abv) { 0.07 }
      let(:ibus) { 70 }
      let(:classification) { "" }
      specify { creator.create; expect(creator).not_to be_a_success }
    end
    
  end

  describe "mocking a failure" do
    it "fails when we say it fails" do
      brew = instance_spy(Brew, save: false)
      allow(Brew).to receive(:new).and_return(brew)
      creator = CreatesBrew.new(
        name: "Name",
        abv: 0.99,
        ibus: 1000.00,
        classification: "Classification"
      )
      creator.create
      expect(creator).not_to be_a_success
    end
  end

end