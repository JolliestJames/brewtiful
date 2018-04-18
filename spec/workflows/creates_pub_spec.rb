require "rails_helper"

RSpec.describe CreatesPub do

  let(:creator) { CreatesPub.new(
    name: name, location: location
  )}

  describe "initialization" do
    let(:name) {"Brother John's West Side"}
    let(:location) {"Bend, OR"}
    it "creates a pub given a name" do
      creator.build
      expect(creator.pub.name).to eq("Brother John's West Side")
      expect(creator.pub.location).to eq("Bend, OR")
    end
  end

  describe "failure cases" do
    let(:name) {""}
    let(:location) {"Bend, OR"}
    it "failes when trying to create a pub without a name" do
      creator.build
      expect(creator).not_to be_a_success
    end
  end 
 
end