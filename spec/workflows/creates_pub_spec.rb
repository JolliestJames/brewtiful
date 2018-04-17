require "rails_helper"

RSpec.describe CreatesPub do

  let(:creator) { CreatesPub.new(
    name: "Brother John's West Side", location: "Bend, OR"
  )}

  describe "initialization" do
    it "creates a pub given a name" do
      creator = Pub.new(name: "Brother John's West Side", location: "Bend, OR")
      creator.build
      expect(creator.pub.name).to eq("Brother John's West Side")
      expect(creator.pub.location).to eq("Bend, OR")
    end
  end 
end