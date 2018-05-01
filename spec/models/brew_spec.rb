require "rails_helper"

RSpec.describe Brew do
  let(:brew) { Brew.new(name: "Hopsmack", abv: 0.068, ibus: 80, classification: "IPA") }

  it "does not have a new brew as consumed" do
    expect(brew).not_to be_consumed
  end

  it "allows us to consume a brew" do
    brew.consume
    expect(brew).to be_consumed
  end

  it "knows if a brew is local" do
    expect(brew.is_local(5)).to be true
  end
  
end