require "rails_helper"

RSpec.describe Pub do
  let(:pub) { Pub.new("Redmond", "The Beer Stop") }
  let(:brew) { Brew.new }

  it "knows that a pub must have at least one brew on tap" do
    pub.tap_list << brew
    expect(pub.has_empty_tap_list?).to be_falsy
  end

  it "knows that a pub has a location" do
    expect(pub.has_location?).to be_truthy
  end

  it "knows that a pub has a name" do
    expect(pub.has_name?).to be_truthy
  end

end