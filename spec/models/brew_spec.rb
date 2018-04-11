require "rails_helper"

RSpec.describe Brew do
  let(:brew) { Brew.new }

  it "does not have a new brew as consumed" do
    expect(brew).not_to be_consumed
  end

  it "allows us to consume a brew" do
    brew.mark_consumed
    expect(brew).to be_consumed
  end

  it "allows us to concoct a brew" do
  	brew.concoct "6.8%", 80, "IPA"
  	expect(brew).to be_concocted
  end
	
	it "is a local brew" do
		brew.is_local  5
		expect(brew).to be_local
  end
  
end