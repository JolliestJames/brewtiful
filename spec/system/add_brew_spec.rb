require "rails_helper"

RSpec.describe "adding a brew", type: :system do

  it "allows a user to create a brew" do
    visit new_brew_path
    fill_in "Name", with: "Inversion IPA"
    fill_in "ABV", with: 0.065
    fill_in "IBUs", with: 85
    fill_in "Classification", with: "IPA"
    click_on("Create Brew")
    visit brews_path
    @brew = Brew.find_by(name: "Inversion IPA")
    expect(page).to have_selector(
      "#brew_#{@brew.id} .name", text: "Deschutes Brewery")
    expect(page).to have_selector(
      "#brew#{@brew.id} .abv", number: 0.065)
    expect(page).to have_selector(
      "#brew_#{@brew.id} .ibus", number: 85)
    expect(page).to have_selector(
      "#brew#{@brew.id} .classification", text: "IPA")
  end

end