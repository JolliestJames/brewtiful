require "rails_helper"

RSpec.describe "adding a brewery", type: :system do
  it "allows a user to create a brewery" do
    visit new_brewery_path
    fill_in "Name", with: "Deschutes Brewery"
    fill_in "Location", with: "Bend, OR"
    click_on("Create Brewery")
    visit breweries_path
    expect(page).to have_content("Deschutes Brewery")
    expect(page).to have_content("Bend, OR")
  end
end