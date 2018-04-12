require "rails_helper"

RSpec.describe Business do
  let(:business) { Business.new("Redmond", "Wild Ride") }

  it "knows that a business has a location" do
    expect(business).to have_location
  end

  it "knows that a business has a name" do
    expect(business).to have_name
  end

end