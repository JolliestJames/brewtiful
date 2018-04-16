require "rails_helper"

RSpec.describe "adding a brewery", type: :system do

  it "allows a user to create a brewery" do
    visit new_brewery_path
    fill_in "Name", with: "Deschutes Brewery"
    fill_in "Location", with: "Bend, OR"
    click_on("Create Brewery")
    visit breweries_path
    @brewery = Brewery.find_by(name: "Deschutes Brewery")
    expect(page).to have_selector(
      "#brewery_#{@brewery.id} .name", text: "Deschutes Brewery")
    expect(page).to have_selector(
      "#brewery_#{@brewery.id} .location", text: "Bend, OR")
  end

  it "does not allow a user to create a brewery without a name" do
    visit new_brewery_path
    fill_in "Name", with: ""
    fill_in "Location", with: "Bend, OR"
    click_on("Create Brewery")
    expect(page).to have_selector(".new_brewery")
  end

end