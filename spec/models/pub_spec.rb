require "rails_helper"

RSpec.describe Pub do
  let(:pub) { Pub.new(location: "Redmond", name:"The Beer Stop") }
  let(:brew) { Brew.new(abv: 0.068, ibus: 80, classification: "IPA") }

  it "knows that a pub is a business" do
    expect(Pub).to be < Business
  end

  it "knows that a pub must have at least one brew on tap" do
    pub.brews << brew
    expect(pub).not_to have_an_empty_tap_list
  end

  it "knows that a pub has a location" do
    expect(pub).to have_location
  end

  it "knows that a pub has a name" do
    expect(pub).to have_name
  end

end