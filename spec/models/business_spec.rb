require "rails_helper"

RSpec.describe do
  let(:business) { Business.new("Redmond", "Wild Ride") }

  it "knows that a business has a location" do
    expect(business.has_location?).to be_truthy
  end

  it "knows that a business has a name" do
    expect(business.has_location?).to be_truthy
  end

end