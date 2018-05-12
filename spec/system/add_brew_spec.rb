require "rails_helper"

RSpec.describe "adding a brew", type: :system do
  let (:brewery) { FactoryBot.create(:brewery) }

  it "allows a user to create a brew" do
    visit new_brew_path
    fill_in "Name", with: "Inversion IPA"
    fill_in "Abv", with: 0.065
    fill_in "Ibus", with: 85
    fill_in "Classification", with: "IPA"
    fill_in "Brewery", with: brewery.id
    click_on("Create Brew")
    visit brews_path
    brew = Brew.find_by(name: "Inversion IPA")
    expect(page).to have_selector(
      "#brew_#{brew.id} .name", text: "Inversion IPA")
    expect(page).to have_selector(
      "#brew_#{brew.id} .abv", text: 0.065)
    expect(page).to have_selector(
      "#brew_#{brew.id} .ibus", text: 85)
    expect(page).to have_selector(
      "#brew_#{brew.id} .classification", text: "IPA")
  end

  it "does not allow a user to create a brew without a name" do
    visit new_brew_path
    fill_in "Name", with: ""
    fill_in "Abv", with: 0.065
    fill_in "Ibus", with: 85
    fill_in "Classification", with: "IPA"
    click_on("Create Brew")
    expect(page).to have_selector(".new_brew")
  end

  it "does not allow a user to create a brew without an abv" do
    visit new_brew_path
    fill_in "Name", with: "Inversion IPA"
    fill_in "Abv", with: nil
    fill_in "Ibus", with: 85
    fill_in "Classification", with: "IPA"
    click_on("Create Brew")
    expect(page).to have_selector(".new_brew")
  end

  it "does not allow a user to create a brew without ibus" do
    visit new_brew_path
    fill_in "Name", with: "Inversion IPA"
    fill_in "Abv", with: 0.065
    fill_in "Ibus", with: nil
    fill_in "Classification", with: "IPA"
    click_on("Create Brew")
    expect(page).to have_selector(".new_brew")
  end

  it "does not allow a user to create a brew without a classification" do
    visit new_brew_path
    fill_in "Name", with: "Inversion IPA"
    fill_in "Abv", with: 0.065
    fill_in "Ibus", with: 85
    fill_in "Classification", with: ""
    click_on("Create Brew")
    expect(page).to have_selector(".new_brew")
  end

  it "behaves correctly in the face of a surprising database failure" do
    workflow = instance_spy(CreatesBrew,
      success?: false, brew: Brew.new)
    allow(CreatesBrew).to receive(:new)
      .with(
        name: "Brew Name",
        abv: 0.99.to_s,
        ibus: 1000.00.to_s,
        classification: "Brew Classification",
        brewery_id: brewery.id.to_s)
      .and_return(workflow)
    visit new_brew_path
    fill_in "Name", with: "Brew Name"
    fill_in "Abv", with: 0.99.to_s
    fill_in "Ibus", with: 1000.00.to_s
    fill_in "Classification", with: "Brew Classification"
    fill_in "Brewery", with: brewery.id.to_s
    click_on("Create Brew")
    expect(page).to have_selector(".new_brew")
  end

end