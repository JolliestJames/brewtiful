require "rails_helper"

RSpec.describe "adding a pub", type: :system do
  it "allows a user to create a pub" do
    visit new_pub_path
    fill_in "Name", with: "Brother John's West Side"
    fill_in "Location", with: "Bend, OR"
    click_on("Create Pub")
    visit pubs_path
    expect(page).to have_content("Brother John's West Side")
    expect(page).to have_content("Bend, OR")
  end
  it "does not allow a user to create a pub without a name" do
    visit new_pub_path
    fill_in "Name", with: ""
    fill_in "Location", with: "Bend, OR"
    click_on("Create Pub")
    visit pubs_path
    expect(page).to have_selector(".new_pub")
  end
end