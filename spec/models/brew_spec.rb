require "rails_helper"

class FakeBigBrewDependency

  def execute
  end

end

RSpec.describe Brew do
  let(:brew) { FactoryBot.build_stubbed(:brew) }

  it "does not have a new brew as consumed" do
    expect(brew).not_to be_consumed
  end

  it "allows us to consume a brew" do
    brew.consume
    expect(brew).to be_consumed
  end

  it "knows if a brew is local" do
    expect(brew.is_local(5)).to be true
  end

  # it "can perform an execution on a big brew dependency" do
  #   big_brew_dependency = BigBrewDependency.new
  #   expect(brew.perform(big_brew_dependency)).to eq(42)
  # end

  it "can perform an execution on a big brew dependency" do
    fake_big_brew_dependency = FakeBigBrewDependency.new
    expect(brew.perform(fake_big_brew_dependency)).to eq(42)
  end
  
end