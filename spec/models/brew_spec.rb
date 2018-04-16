require "rails_helper"

RSpec.describe Brew do
  let(:brew) { Brew.new(abv: 0.068, ibus: 80, classification: "IPA") }

  it "does not have a new brew as consumed" do
    expect(brew).not_to be_consumed
  end

  it "allows us to consume a brew" do
    brew.mark_consumed
    expect(brew).to be_consumed
  end

  it "is a local brew" do
    brew.is_local(5)
    expect(brew).to be_local
  end
  
end